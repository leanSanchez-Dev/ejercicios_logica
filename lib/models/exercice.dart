class Exercice {
  final int id;
  final String title;
  final String difficulty;
  final String number;

  Exercice({
    required this.id,
    required this.title,
    required this.difficulty,
    required this.number,
  });

  factory Exercice.fromJson(Map<String, dynamic> json) {
    return Exercice(
      id: json['id'],
      title: json['title'],
      difficulty: json['difficulty'],
      number: json['number'],
    );
  }
}
