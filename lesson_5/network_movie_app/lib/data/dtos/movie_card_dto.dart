import 'package:json_annotation/json_annotation.dart';

part 'movie_card_dto.g.dart';

@JsonSerializable()
class MovieCardDTO {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String title;

  @JsonKey(name: 'poster')
  final FilmCardPosterDTO? picture;

  @JsonKey(name: 'rating')
  final FilmCardRatingDTO? voteAverage;

  @JsonKey(name: 'year')
  final int? releaseDate;

  @JsonKey(name: 'description')
  final String? description;

  MovieCardDTO({
    required this.id,
    required this.title,
    this.picture,
    this.voteAverage,
    this.releaseDate,
    this.description,
  });

  factory MovieCardDTO.fromJson(Map<String, dynamic> json) =>
      _$MovieCardDTOFromJson(json);
}

@JsonSerializable()
class FilmCardPosterDTO {
  @JsonKey(name: 'url', defaultValue: '')
  final String? url;

  FilmCardPosterDTO({
    this.url,
  });

  factory FilmCardPosterDTO.fromJson(Map<String, dynamic> json) =>
      _$FilmCardPosterDTOFromJson(json);
}

@JsonSerializable()
class FilmCardRatingDTO {
  @JsonKey(name: 'kp', defaultValue: 0)
  final double? kp;

  FilmCardRatingDTO({
    this.kp,
  });

  factory FilmCardRatingDTO.fromJson(Map<String, dynamic> json) =>
      _$FilmCardRatingDTOFromJson(json);
}
