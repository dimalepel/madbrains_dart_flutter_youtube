import '../models/movie.dart';
import '../models/cinema.dart';

List<Movie> _movies = [
  Movie(
      id: '1',
      title: 'Мое прекрасное несчастье',
      picture: 'assets/images/pic--poster-1.jpg',
      voteAverage: 10.0,
      releaseDate: '10.11.2023',
      description: 'Описание скоро будет...',
      language: 'Русский',
      isSubscription: true,
  ),
  Movie(
      id: '2',
      title: 'Домашняя игра',
      picture: 'assets/images/pic--poster-2.jpg',
      voteAverage: 20.0,
      releaseDate: '20.11.2023',
      description: 'Описание скоро будет...',
      language: 'Английский',
      isSubscription: false
  ),
  Movie(
      id: '3',
      title: 'Салют 7',
      picture: 'assets/images/pic--poster-3.jpg',
      voteAverage: 30.0,
      releaseDate: '30.11.2023',
      description: 'Описание скоро будет...',
      language: 'Русский',
      isSubscription: false
  ),
  Movie(
      id: '4',
      title: 'Поймай меня, если сможешь',
      picture: 'assets/images/pic--poster-4.jpg',
      voteAverage: 40.0,
      releaseDate: '04.12.2023',
      description: 'Описание скоро будет...',
      language: 'Русский',
      isSubscription: true
  ),
];

enum Language {
  russian,
  english
}

mixin Converter on Cinema {
  stringToEnum() {
    String lang = language.toLowerCase();
    dynamic langConverted;

    switch (lang) {
      case 'английский':
        langConverted = Language.english;
        break;
      case 'русский':
        langConverted = Language.russian;
        break;
    }

    return langConverted;
  }
}

extension PrettyString on Language {
  String toPrettyString() {
    String language;

    switch (this) {
      case Language.english:
        language = 'Английский';
        break;
      case Language.russian:
        language = 'Русский';
        break;
    }

    return language;
  }
}

Future<List<Movie>> getMovies() async {
  return _movies;
}

List<Movie> filterMovie(int rating, Language language, bool isSubscription) {
  if (isSubscription == false) return _movies.where((movie) => (movie.voteAverage >= rating && movie.stringToEnum() == language)).toList();

  return _movies.where((movie) => (movie.voteAverage >= rating && movie.stringToEnum() == language && movie.isSubscription == isSubscription)).toList();
}