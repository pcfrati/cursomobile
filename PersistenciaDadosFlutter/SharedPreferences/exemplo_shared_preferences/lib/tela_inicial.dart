//? janela inical do aplicativo
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaInicial extends StatefulWidget{  // janela com alteração de estado (setState)
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

// construção da janela do página
class _TelaInicialState extends State<TelaInicial>{
  // atributos
  TextEditingController _nomeController = TextEditingController();
  String _nome = "";
  bool _darkMode = false;

  // métodos
  @override
  void initState() {
    super.initState();
    _carregarNome();
  }

  void _salvarPreferencias() async {  // método roda de forma assincrona
    if (_nomeController.text.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Preencha o nome do usuário")));
    } else{
      SharedPreferences _prefs = await SharedPreferences.getInstance(); // espera estabelecer a conexão para pegar a informação (await)
      _nome = _nomeController.text;
      // salvar no shared preference a chave/valor
      _prefs.setString("nome",_nome);
      setState(() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Nome do usuário preenchido")));
      _nomeController.clear();
      });
    }
  }

  void _mudarTema() async{
    _darkMode = !_darkMode;  // inverte o valor da boolean
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool("darkMode",_darkMode);
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_darkMode ? "Modo Escuro" : "Modo Claro")));
    });
  }

  void _carregarNome() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      _nome = _prefs.getString("nome") ?? "";
      _darkMode = _prefs.getBool("darkMode") ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {  // construtor de janela
    return AnimatedTheme(
      data: _darkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bem-vindo ${_nome=="" ? "Visitante" : _nome}"),
          actions: [IconButton(
            onPressed: _mudarTema, 
            icon: Icon(_darkMode ? Icons.nightlight_outlined : Icons.nightlight))],
          ),  //! operador ternário
        body: Padding(padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: "Nome do Usuário"),
            ),
            ElevatedButton(onPressed: _salvarPreferencias, 
            child: Text("Salvar usuário"))
          ],
        ),),
      ),
    );
  }
}