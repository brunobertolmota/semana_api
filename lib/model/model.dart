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

  get model => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data["nome"] = nome;
    data["idade"] = idade;
    data["id"] = id;

    return data;
  }

  @override
  String toString() {
    return 'Pessoa de nome: $nome  e idade: $idade' ;
  }
}
