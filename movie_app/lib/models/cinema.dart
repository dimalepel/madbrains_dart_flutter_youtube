abstract class Cinema {
  String id;
  String title;
  String picture;
  double voteAverage;
  String releaseDate;
  String description;
  String language;
  bool isSubscription;

  Cinema({
    required this.id,
    required this.title,
    required this.picture,
    required this.voteAverage,
    required this.description,
    required this.releaseDate,
    required this.language,
    required this.isSubscription
  });
}