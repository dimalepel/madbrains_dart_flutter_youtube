class MovieCardModel {
  final int id;
  final String title;
  final String? picture;
  final double? voteAverage;
  final int? releaseDate;
  final String? description;

  MovieCardModel({
    required this.id,
    required this.title,
    this.picture,
    this.voteAverage,
    this.releaseDate,
    this.description,
  });
}
