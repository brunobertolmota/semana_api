class Person {
  String? name;
  int? age;
  String? id;

  Person({
    this.name,
    this.age,
    this.id,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        name: json["name"],
        age: json["age"],
        id: json["id"],
      );

  get model => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data["name"] = name;
    data["age"] = age;
    data["id"] = id;

    return data;
  }

  @override
  String toString() {
    return 'Pessoa de nome: $name  e age: $age' ;
  }
}
