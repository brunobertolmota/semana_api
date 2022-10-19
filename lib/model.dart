class Apiteste {
  
    String? nome;
    int? idade;
    String? id;


    Apiteste({
        this.nome,
        this.idade,
        this.id,
    });


    factory Apiteste.fromJson(Map<String, dynamic> json) => Apiteste(
        nome: json["nome"],
        idade: json["idade"],
        id: json["id"],
    );

    Map<String, dynamic> toJson()  {
      final Map<String, dynamic> data = {};

        data["nome" ]= nome;
        data["idade"] = idade;
        data["id"] = id;

        return data;
    }
}