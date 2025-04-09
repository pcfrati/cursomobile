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
  bool _senhaOculta = true;
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
              //! campo nome
              TextFormField(
                decoration: InputDecoration(labelText: "Insira o nome"),
                validator: (value) => value!.trim().isEmpty ? "Digite um nome" : null, // operador ternário
                onSaved: (value)=> _nome = value!.trim(),
              ),
              SizedBox(height: 15,),

              //! campo email
              TextFormField(
                decoration: InputDecoration(labelText: "Insira o email"),
                validator: (value) => value!.contains("@") ? null : "Digite um email válido",
                onSaved: (value) => _email = value!.trim(),
              ),
              SizedBox(height: 15,),
              
              //! campo senha
              TextFormField(
                decoration: InputDecoration(labelText: "Insira a Senha",
                prefixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      _senhaOculta = !_senhaOculta;
                    });
                  }, icon: Icon(Icons.remove_red_eye)
                )),
                obscureText: _senhaOculta,
                validator: (value) => value!.trim().length>=6 ? null : "Digite uma Senha Válida",
                onSaved: (value)=>_senha = value!.trim(),
              ),
              SizedBox(height: 15,),
              
              //! campo gênero
              Text("Gênero"),
              DropdownButtonFormField(
                items: ["Feminino", "Masculino", "Outro", "Prefiro não informar"].map((String genero)=>DropdownMenuItem(
                  value: genero,
                  child:Text(genero))).toList(), 
                onChanged: (value){},
                validator: (value) => value==null ? "Selecione um Gênero" : null,
                onSaved: (value) => _genero = value!
                ),
                SizedBox(height: 15,),
              
              //! campo nascimento
              TextFormField(
                decoration: InputDecoration(labelText: "Informe a data de nascimento"),
                validator: (value) => value!.trim().isEmpty ? "Digite uma data" : null,
                onSaved: (value)=> _dataNascimento = value!.trim(),
              ),
              SizedBox(height: 15,),
              
              //! campo experiência
              Text("Anos de Experiência com Programação: "),
              Slider(value: _experiencia, min: 0, max: 20, divisions: 20, label: _experiencia.round().toString(), onChanged: (value)=>setState(() {
                _experiencia = value;
              })),
              SizedBox(height: 15,),
              
              CheckboxListTile(
                value: _aceite,
                title: Text("Aceite os termos de uso do aplicativo"),
                onChanged: (value)=>setState(() {
                  _aceite = value!;
                })),
                SizedBox(height: 15,),

              ElevatedButton(onPressed: _enviarFormulario, child: Text("Enviar"))
            ],
          )),
        ),
    );
  }

  void _enviarFormulario() {
    if(_formKey.currentState!.validate() && _aceite){
      _formKey.currentState!.save();
      showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text("Dados do Formulário"),
          content: Column(
            children: [
              Text("Nome: $_nome"),
              Text("Email: $_email")
            ],
          ),
        ));
    }
  }
}