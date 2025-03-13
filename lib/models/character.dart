class Character {
  final String id;
  final String name;
  final String? image;
  final String gender;
  final String age;
  final String hairColor;
  final String eyeColor;

  Character({
    required this.id,
    required this.name,
    required this.image,
    required this.gender,
    required this.age,
    required this.hairColor,
    required this.eyeColor
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      gender: json['gender'],
      age: json['age'],
      eyeColor: json['eye_color'],
      hairColor: json['hair_color']
    );
  }
}
