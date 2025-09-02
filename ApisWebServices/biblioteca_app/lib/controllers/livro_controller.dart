import 'package:biblioteca_app/services/api_service.dart';

import '../models/livro_model.dart';

class LivroController {
  //& métodos

  //? GET | All 
  Future<List<LivroModel>> fetchAll() async {
    final list = await ApiService.getList("livros?_sort=titulo");
    return list.map<LivroModel>((item) => LivroModel.fromJson(item)).toList();
  }


  //? GET | One
  Future<LivroModel> fetchOne(String id) async {
    final livro = await ApiService.getOne("livros", id);
    return LivroModel.fromJson(livro);
  }

  //? POST
  Future<LivroModel> create(LivroModel u) async {
    final created = await ApiService.post("livros", u.toJson());
    //* adicionar o livro e retorna o livro adicionado
    return LivroModel.fromJson(created);
  }

  //? PUT
  Future<LivroModel> update(LivroModel u) async {
    final updated = await ApiService.put("livros", u.toJson(), u.id!);
    //* retorna o livro atualizado
    return LivroModel.fromJson(updated);
  }

  //? DELETE
  Future<void> delete(String id) async {
    await ApiService.delete("livros", id);
    //* não tem retorno
  }
}
