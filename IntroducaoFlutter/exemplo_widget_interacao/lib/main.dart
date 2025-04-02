import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: TelaCadastroApp()));
}

//criar uma tela de Cadastro (formulário) - 
class TelaCadastroApp extends StatefulWidget{
  @override
  _TelaCadastroAppState createState() => _TelaCadastroAppState();
}

class _TelaCadastroAppState extends State<TelaCadastroApp>{
// atributos !
  final _formKey = GlobalKey<FormState>(); // '_' significa privado
  String _nome = "";
  String _email = "";
  String _senha = "";
  String _genero = "";
  String _dataNascimento = "";
  double _experiencia = 0;
  bool _aceite = false;
// métodos !
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro de Usuário | Exemplo Widget Interação")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Insira o nome"),
                validator: (value) => value!.trim().isEmpty ? "Digite um nome" : null, // operador ternário
                onSaved: (value)=> _nome = value!.trim(),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Insira o email"),
                validator: (value) => value!.contains("@") ? null : "Digite um email válido",
                onSaved: (value) => _email = value!.trim(),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Insira a senha"),
                validator: (value) => value!.trim().length>=6 ? null : "Digite uma senha válida",
                onSaved: (value) => _senha = value!.trim(),
                obscureText: true,
              ),
              Text("Gênero"),
              DropdownButtonFormField(
                items: ["Feminino", "Masculino", "Outro", "Prefiro não informar"].map((String genero)=>DropdownMenuItem(
                  value: genero,
                  child:Text(genero))).toList(), 
                onChanged: (value){},
                validator: (value) => value==null ? "Selecione um Gênero" : null,
                onSaved: (value) => _genero = value!
                ),
              TextFormField(
                decoration: InputDecoration(labelText: "Informe a data de nascimento"),
                validator: (value) => value!.trim().isEmpty ? "Digite uma data" : null,
                onSaved: (value)=> _dataNascimento = value!.trim(),
              ),
              Text("Anos de Experiência com Programação: "),
              Slider(value: _experiencia, min: 0, max: 20, divisions: 10, label: _experiencia.round().toString(), onChanged: (value)=>setState(() {
                _experiencia = value;
              })),
              CheckboxListTile(
                value: _aceite,
                title: Text("Aceite os termos de uso do aplicativo"),
                onChanged: (value)=>setState(() {
                  _aceite = value!;
                })),
              ElevatedButton(onPressed: _enviarFormulario, child: Text("Enviar"))
            ],
          )),
        ),
    );
  }

  void _enviarFormulario() {

  }
}