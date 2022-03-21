class City {
  int? id;
  String nome;

  City({
    this.id,
    required this.nome,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json['id'],
        nome: json['nome'],
      );

  @override
  String toString() {
    return 'City:{id: $id, nome: $nome}';
  }
}
