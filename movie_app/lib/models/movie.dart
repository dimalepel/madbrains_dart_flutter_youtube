import 'cinema.dart';
import 'package:movie_app/utils/utils.dart';

class Movie extends Cinema with Converter {
  Movie({
    id,
    title,
    picture,
    voteAverage,
    releaseDate,
    description,
    language,
    isSubscription
  }) : super(
      id: id,
      title: title,
      picture: picture,
      voteAverage: voteAverage,
      description: description,
      releaseDate: releaseDate,
      language: language,
      isSubscription: isSubscription
  );
}


