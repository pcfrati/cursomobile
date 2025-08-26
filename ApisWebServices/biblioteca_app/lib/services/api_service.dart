//& classe para auxiliar nas chamadas da API

import 'dart:convert';

import 'package:http/http.dart' as http;

class APiService {
  // atributos e métodos da classe e não do objeto
  //* base URL para conexão API
  // static -> transforma o atributo em atributo da classe  não do objeto
  static const String _baseUrl = "http://10.109.197.8:3013";

  //? métodos
  //* GET (listar todos os recurso)
  static Future<List<dynamic>> getList(String path) async {
    final res = await http.get(
      Uri.parse("$_baseUrl/$path"),
    ); // uri -> convert string -> URL
    if (res.statusCode == 200) return json.decode(res.body,); //? deu certo convert as resposta de json -> list dynamic e final
    //! se não deu certo -> gerar um erro
    throw Exception("Falha ao Carregar Lista de $path");
  }

  //* GET (Listar um único recurso)
  static Future<Map<String, dynamic>> getOne(String path, String id) async {
    final res = await http.get(Uri.parse("$_baseUrl/$path/$id"));
    if (res.statusCode == 200) return json.decode(res.body);
    //! se não deu certo -> gerar um erro
    throw Exception("Falha ao Carregar Recurso de $path");
  }

  //* POST (criar novo recurso)
  static Future<Map<String, dynamic>> post(
    String path,
    Map<String, dynamic> body,
  ) async {
    final res = await http.post(
      //endereço da api
      Uri.parse("$_baseUrl/$path"),
      //headers
      headers: {"Content-Type/": "application/json"},
      body: json.encode(body),
    );
    if (res.statusCode == 201) return json.decode(res.body);
    //! se não deu certo -> gerar um erro
    throw Exception("Falha ao Criar Recurso em $path");
  }

  //* PUT (atualizar recurso)
  static Future<Map<String,dynamic>> put(String path, Map<String,dynamic> body, String id) async{
    final res = await http.put(
      //endereço da api
      Uri.parse("$_baseUrl/$path/$id"),
      //headers
      headers: {"Content-Type/":"application/json"},
      body: json.encode(body)
    );
    if(res.statusCode == 200) return json.decode(res.body);
    //se não deu certo -> gerar erro
    throw Exception("Falha ao Alterar Recurso em $path");
  }

  //* DELETE (apagar recurso)
  static delete(String path, String id) async{
    final res = await http.delete(Uri.parse("$_baseUrl/$path/$id"));
    //se deu certo apaga o resurso, se deu errado retorna o erro
    if ( res.statusCode != 200) throw Exception("Falha ao Deletar Recurso $path");
  }
}