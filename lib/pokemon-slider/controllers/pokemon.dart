import 'dart:convert';

class Pokemon {
  String number;
  String name;
  List<String> types;
  String attack;
  String defense;
  String hp;

  Pokemon(
      {required this.number,
      required this.name,
      required this.types,
      required this.attack,
      required this.defense,
      required this.hp});

  factory Pokemon.fromJson(String str) => Pokemon.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  String getName() {
    return name;
  }

  factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
        number: json["id"],
        name: json["name"],
        types: json["types"],
        attack: json["attack"],
        defense: json["defense"],
        hp: json["hp"],
      );

  Map<String, dynamic> toMap() => {
        "id": number,
        "name": name,
        "types": types,
        "attack": attack,
        "defense": defense,
        "hp": hp,
      };
}
