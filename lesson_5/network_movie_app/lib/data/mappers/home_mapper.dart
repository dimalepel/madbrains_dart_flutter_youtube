import 'package:network_movie_app/data/mappers/movie_mapper.dart';

import '../../domain/models/home_model.dart';
import '../dtos/home_dto.dart';
import '../dtos/movie_card_dto.dart';

extension HomeFromDTOToDomain on HomeDTO {
  HomeModel toDomain() {
    return HomeModel(
      results: results?.map((MovieCardDTO e) => e.toDomain()).toList(),
    );
  }
}
