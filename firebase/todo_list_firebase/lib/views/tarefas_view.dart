import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TarefasView extends StatefulWidget {
  const TarefasView({super.key});

  @override
  State<TarefasView> createState() => _TarefasViewState();
}

class _TarefasViewState extends State<TarefasView> {
  //& atributos
  final FirebaseFirestore _db =
      FirebaseFirestore.instance; //* controlador do Cloud_Store
  final User? _user = FirebaseAuth
      .instance
      .currentUser; //* pega as informações do Usuário Conectado
  final TextEditingController _tarefaField = TextEditingController();

  //? adicionar tarefa
  void _addTarefa() async {
    if (_tarefaField.text.trim().isEmpty)
      return; //return null => interromper o método
    //adicionar a tarefa no firestore (BD)
    await _db.collection("usuarios").doc(_user!.uid).collection("tarefas").add({
      "titulo": _tarefaField.text.trim(),
      "concluida": false,
      "dataCriacao": Timestamp.now(), //data e hora em miliseconds
    });
  }

  //? atualizar status da tarefa
  void _atualizarTarefa(String tarefaID, bool status) async {
    await _db
        .collection("usuarios")
        .doc(_user!.uid)
        .collection("tarefas")
        .doc(tarefaID)
        .update({"concluida": !status});
  }

  //! deletar tarefa
  void _deleteTarefa(String tarefaID) async {
    await _db
        .collection("usuarios")
        .doc(_user!.uid)
        .collection("tarefas")
        .doc(tarefaID)
        .delete();
  }

  //* método para pegar as tarefas -> build da tela

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Tarefas"),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      //* construir a lisa de tarefas, mas se tiver a lista
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _tarefaField,
              decoration: InputDecoration(
                labelText: "Nova Tarefa",
                suffix: IconButton(
                  onPressed: _addTarefa,
                  icon: Icon(Icons.add, color: Colors.green),
                ),
              ),
            ),
            SizedBox(height: 16),
            //* inserir a lista de tarefas do usuário
            // o que será exibido depende d abusca no firestore
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _db
                    .collection("usuarios")
                    .doc(_user!.uid)
                    .collection("tarefas")
                    .orderBy("dataCriacao", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text("Sem Tarefa Por Enquanto"));
                  }
                  //* exibir as tarefas
                  final tarefas = snapshot
                      .data!
                      .docs; // adiciona a busca ao vetor de tarefas
                  return ListView.builder(
                    itemCount: tarefas.length,
                    itemBuilder: (context, index) {
                      final tarefa = tarefas[index]; // tarefas em formato json
                      //converter json => Map<string, dynamic>
                      final tarefaMap = tarefa.data() as Map<String, dynamic>;
                      bool concluida = tarefaMap["concluida"] == true ? true : false;
                      
                      return ListTile(
                        title: Text(tarefaMap["titulo"]),
                        leading: Checkbox(
                          value: concluida, 
                          onChanged: (value){
                            setState(() {
                              _atualizarTarefa(tarefa.id, concluida);
                            });
                          }),
                        trailing: IconButton(
                          onPressed: ()=> _deleteTarefa(tarefa.id), 
                          icon: Icon(Icons.delete, color: Colors.red,)),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
