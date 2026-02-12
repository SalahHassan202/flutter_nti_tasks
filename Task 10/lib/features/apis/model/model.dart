class FilmModel {
  final String title;
  final String description;
  final String director;
  final String producer;
  final String releaseDate;

  FilmModel({
    required this.title,
    required this.description,
    required this.director,
    required this.producer,
    required this.releaseDate,
  });

  factory FilmModel.fromJson(Map<String, dynamic> json) {
    return FilmModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      director: json['director'] ?? '',
      producer: json['producer'] ?? '',
      releaseDate: json['release_date'] ?? '',
    );
  }
}
