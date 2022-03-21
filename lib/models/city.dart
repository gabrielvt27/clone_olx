class City {
  int id;
  String nome;

  City({
    required this.id,
    required this.nome,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json['id'],
        nome: json['nome'],
      );
}
