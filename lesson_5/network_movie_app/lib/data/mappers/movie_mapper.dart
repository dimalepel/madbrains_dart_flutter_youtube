import '../../domain/models/movie_card_model.dart';
import '../dtos/movie_card_dto.dart';

extension MovieCardFromDTOToDomain on MovieCardDTO {
  MovieCardModel toDomain() {
    return MovieCardModel(
      id: id,
      title: title,
      picture: picture?.url,
      releaseDate: releaseDate,
      voteAverage: voteAverage?.kp,
      description: description,
    );
  }
}
