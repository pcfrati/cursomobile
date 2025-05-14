import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {  // método principal para rodar a aplicação
  runApp(MaterialApp(  // base de todos os wdiget(elementos visuais do aplicativo)
  home: TelaPerfil(),  //tela inicial
  //routes:{
  
  //} , rotas de navegação
  //theme: , //tema do aplicativo
  //darkTheme: , //tema alternativo
  debugShowCheckedModeBanner: false,  //remove o banner vermelho
  ));
}

class TelaPerfil extends StatefulWidget {
  @override
  State<TelaPerfil> createState() => _TelaPerfilState();  // chama a mudança
}

class _TelaPerfilState extends State<TelaPerfil>{  // constrói a tela
  // atributos
  TextEditingController _nomeController = TextEditingController();  //recebe os dados de input
  TextEditingController _idadeController = TextEditingController();

  String? _nome;  // permite variaveis nulas
  String? _idade;  // permite variaveis nulas

  String? _cor;

  Map<String,Color> coresDisponiveis= {
    "Azul": Colors.blue,
    "Verde": Colors.green,
    "Vermelho": Colors.red,
    "Amarelo": Colors.yellow,
    "Cinza": Colors.grey,
    "Branco": Colors.white,
    "Preto": Colors.black
  };  // fecha map

  // criar a cor de fundo
  Color _corFundo = Colors.white;

  // métodos
  @override
  void initState() {  // carrega informações antes de buildar a tela
    super.initState();
    _carregarPreferencias();
  }

  _carregarPreferencias() async {  // métodos assincrono (sem ordem de execução)
    SharedPreferences _prefs = await SharedPreferences.getInstance(); 
    setState(() {  //mudança de estado
      _nome = _prefs.getString("nome");
      _idade = _prefs.getString("idade");
      _cor = _prefs.getString("cor");
      if (_cor != null) {
        _corFundo = coresDisponiveis[_cor!]!;  // o ! permite nulo 
      }

      _nomeController.text = _nome ?? "";
      _idadeController.text = _idade ?? "";
    });
  }



  _salvarPreferencias() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
  _nome = _nomeController.text.trim();
  _idade = _idadeController.text.trim();
  _corFundo = coresDisponiveis[_cor!]!;

    await _prefs.setString("nome", _nome ?? "");  // armazena o nome
    await _prefs.setString("idade", _idade ?? "");  // armazena a idade como double
    await _prefs.setString("cor", _cor ?? "Branco");  // armazena a cor, caso nulo armazena branco
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _corFundo,
      appBar: AppBar(title: Text("Meu perfil persistente"),
      backgroundColor: const Color.fromARGB(255, 255, 200, 219),),
      body: Padding(padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          TextField(
            controller: _nomeController,
            decoration: InputDecoration(labelText: "Nome"),
          ),
          TextField(
            controller: _idadeController,
            decoration: InputDecoration(labelText: "Idade"),
            keyboardType: TextInputType.numberWithOptions(),
          ),
          SizedBox(height: 16,),
          DropdownButtonFormField(
            value: _cor,
            decoration: InputDecoration(labelText: "Cor favorita"),
            items: coresDisponiveis.keys.map(
              (cor){
                return DropdownMenuItem(
                  value: cor,
                  child: Text(cor));
              }
            ).toList(),
            onChanged: (valor){
              setState(() {
                _cor = valor;
              });
            }),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: _salvarPreferencias, child: Text("Salvar Dados")),
            SizedBox(height: 16,),
            Divider(),
            SizedBox(height: 16,),
            Text("Dados Salvos:"),
            if(_nome != null)
              Text("Nome: $_nome"),
            if(_idade != null)
              Text("Idade: $_idade"),
            if(_cor != null)
              Text("Cor Favorita: $_cor"),
        ],
      ),),
    );
  }
}