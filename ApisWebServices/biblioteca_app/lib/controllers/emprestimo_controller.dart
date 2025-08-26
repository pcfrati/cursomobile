import 'package:biblioteca_app/services/api_service.dart';
import '../models/emprestimo_model.dart';

class EmprestimoController {
  //& métodos

  //? GET | All
  Future<List<EmprestimoModel>> fetchAll() async {
    final list = await APiService.getList("emprestimos");
    //* retorna a lista de empréstimos convertida para EmprestimoModel
    return list.map<EmprestimoModel>((item) => EmprestimoModel.fromJson(item)).toList();
  }

  //? GET | One
  Future<EmprestimoModel> fetchOne(String id) async {
    final emprestimo = await APiService.getOne("emprestimos", id);
    return EmprestimoModel.fromJson(emprestimo);
  }

  //? POST
  Future<EmprestimoModel> create(EmprestimoModel e) async {
    final created = await APiService.post("emprestimos", e.toJson());
    //* adicionar o empréstimo e retorna o objeto criado
    return EmprestimoModel.fromJson(created);
  }

  //? PUT
  Future<EmprestimoModel> update(EmprestimoModel e) async {
    final updated = await APiService.put("emprestimos", e.toJson(), e.id!);
    //* retorna o empréstimo atualizado
    return EmprestimoModel.fromJson(updated);
  }

  //? DELETE
  Future<void> delete(String id) async {
    await APiService.delete("emprestimos", id);
    //* não tem retorno
  }
}
