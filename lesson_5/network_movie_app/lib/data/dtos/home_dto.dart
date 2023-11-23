import 'package:json_annotation/json_annotation.dart';

import 'movie_card_dto.dart';

part 'home_dto.g.dart';

@JsonSerializable()
class HomeDTO {
  @JsonKey(name: 'docs')
  final List<MovieCardDTO>? results;

  HomeDTO({
    this.results,
  });

  factory HomeDTO.fromJson(Map<String, dynamic> json) {
    return _$HomeDTOFromJson(json);
  }
}
