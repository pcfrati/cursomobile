import 'package:biblioteca_app/services/api_service.dart';

import '../models/livro_model.dart';

class LivroController {
  //& métodos

  //? GET | All 
  Future<List<LivroModel>> fetchAll() async {
    final list = await APiService.getList("livros_sort=titulo");
    //* retorna a lista de livros convertida para livro Model(DART)
    return list.map<LivroModel>((item)=>LivroModel.fromJson(item)).toList();
  }

  //? GET | One
  Future<LivroModel> fetchOne(String id) async {
    final livro = await APiService.getOne("livros", id);
    return LivroModel.fromJson(livro);
  }

  //? POST
  Future<LivroModel> create(LivroModel u) async {
    final created = await APiService.post("livros", u.toJson());
    //* adicionar o livro e retorna o livro adicionado
    return LivroModel.fromJson(created);
  }

  //? PUT
  Future<LivroModel> update(LivroModel u) async {
    final updated = await APiService.put("livros", u.toJson(), u.id!);
    //* retorna o livro atualizado
    return LivroModel.fromJson(updated);
  }

  //? DELETE
  Future<void> delete(String id) async {
    await APiService.delete("livros", id);
    //* não tem retorno
  }
}
