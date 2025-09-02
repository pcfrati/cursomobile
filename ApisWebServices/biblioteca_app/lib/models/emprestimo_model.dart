class EmprestimoModel {
  // atributos
  final String id;
  final String usuarioId;
  final String livroId;
  final String dataEmprestimo;
  final String dataDevolucao;
  final String devolvido;

  // construtor
  EmprestimoModel({
    required this.id,
    required this.usuarioId,
    required this.livroId,
    required this.dataEmprestimo,
    required this.dataDevolucao,
    required this.devolvido,
  });

  // toJson
  Map<String, dynamic> toJson() => {
        "id": id,
        "usuarioId": usuarioId,
        "livroId": livroId,
        "dataEmprestimo": dataEmprestimo,
        "dataDevolucao": dataDevolucao,
        "devolvido": devolvido,
      };

  // fromJson
  factory EmprestimoModel.fromJson(Map<String, dynamic> json) => EmprestimoModel(
        id: json["id"].toString(),
        usuarioId: json["usuarioId"].toString(),
        livroId: json["livroId"].toString(),
        dataEmprestimo: json["dataEmprestimo"].toString(),
        dataDevolucao: json["dataDevolucao"].toString(),
        devolvido: json["devolvido"].toString(),
      );
}