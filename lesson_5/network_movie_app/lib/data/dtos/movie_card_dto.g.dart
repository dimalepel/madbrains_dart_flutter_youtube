// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCardDTO _$MovieCardDTOFromJson(Map<String, dynamic> json) => MovieCardDTO(
      id: json['id'] as int,
      title: json['name'] as String,
      picture: json['poster'] == null
          ? null
          : FilmCardPosterDTO.fromJson(json['poster'] as Map<String, dynamic>),
      voteAverage: json['rating'] == null
          ? null
          : FilmCardRatingDTO.fromJson(json['rating'] as Map<String, dynamic>),
      releaseDate: json['year'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$MovieCardDTOToJson(MovieCardDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.title,
      'poster': instance.picture,
      'rating': instance.voteAverage,
      'year': instance.releaseDate,
      'description': instance.description,
    };

FilmCardPosterDTO _$FilmCardPosterDTOFromJson(Map<String, dynamic> json) =>
    FilmCardPosterDTO(
      url: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$FilmCardPosterDTOToJson(FilmCardPosterDTO instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

FilmCardRatingDTO _$FilmCardRatingDTOFromJson(Map<String, dynamic> json) =>
    FilmCardRatingDTO(
      kp: (json['kp'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$FilmCardRatingDTOToJson(FilmCardRatingDTO instance) =>
    <String, dynamic>{
      'kp': instance.kp,
    };
