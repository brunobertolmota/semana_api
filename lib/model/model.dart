class ApitesteModel {
  String? nome;
  int? idade;
  String? id;

  ApitesteModel({
    this.nome,
    this.idade,
    this.id,
  });

  factory ApitesteModel.fromJson(Map<String, dynamic> json) => ApitesteModel(
        nome: json["nome"],
        idade: json["idade"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data["nome"] = nome;
    data["idade"] = idade;
    data["id"] = id;

    return data;
  }
}
