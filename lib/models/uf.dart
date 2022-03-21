class UF {
  int id;
  String sigla;
  String nome;

  UF({
    required this.id,
    required this.sigla,
    required this.nome,
  });

  factory UF.fromJson(Map<String, dynamic> json) => UF(
        id: json['id'],
        sigla: json['sigla'],
        nome: json['nome'],
      );

  @override
  String toString() {
    return 'UF:{id: $id, sigla: $sigla, nome: $nome}';
  }
}
