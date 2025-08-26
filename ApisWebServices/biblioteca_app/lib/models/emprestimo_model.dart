class EmprestimoModel {
  // atributos
  final String? id; // pode ser nulo inicialmente
  final int usuarioId;
  final int livroId;
  final String dataEmprestismo;
  final String dataDevolucao;
  final bool devolvido;

  // construtor
  EmprestimoModel({
    this.id,
    required this.usuarioId,
    required this.livroId,
    required this.dataEmprestismo,
    required this.dataDevolucao,
    required this.devolvido,
  });

  // métodos
  // toJson
  Map<String, dynamic> toJson() => {
        "id": id,
        "usuarioId": usuarioId,
        "livroId": livroId,
        "dataEmprestismo": dataEmprestismo,
        "dataDevolucao": dataDevolucao,
        "devolvido": devolvido,
      };

  // fromJson
  factory EmprestimoModel.fromJson(Map<String, dynamic> json) => EmprestimoModel(
        id: json["id"]?.toString(),
        usuarioId: json["usuarioId"] is int ? json["usuarioId"] : int.parse(json["usuarioId"].toString()),
        livroId: json["livroId"] is int ? json["livroId"] : int.parse(json["livroId"].toString()),
        dataEmprestismo: json["dataEmprestismo"].toString(),
        dataDevolucao: json["dataDevolucao"].toString(),
        devolvido: json["devolvido"] as bool,
      );
}