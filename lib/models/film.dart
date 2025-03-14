class Film {
  final String id;
  final String title;
  final String originalTitle;
  final String image;
  final String description;
  final String director;
  final String producer;
  final String releaseDate;

  Film({
    required this.id,
    required this.title,
    required this.image,
    required this.originalTitle,
    required this.description,
     required this.director,
    required this.producer,
    required this.releaseDate,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      originalTitle: json['original_title_romanised'],
      description: json['description'],
      director: json['director'],
      producer: json['producer'],
      releaseDate: json['release_date']
    );
  }
}
