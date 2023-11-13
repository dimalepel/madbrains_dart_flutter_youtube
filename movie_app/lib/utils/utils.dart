import '../models/movie.dart';

List<Movie> _movies = [
  Movie(
      id: '1',
      title: 'Синий жук',
      picture: 'images/poster-1.jpg',
      voteAverage: 10.0,
      releaseDate: '10.11.2023',
      description: 'Описание скоро будет...',
      language: Language.russian
  ),
  Movie(
      id: '2',
      title: 'Домашняя игра',
      picture: 'images/poster-2.jpg',
      voteAverage: 20.0,
      releaseDate: '20.11.2023',
      description: 'Описание скоро будет...',
      language: Language.english
  ),
  Movie(
      id: '3',
      title: 'Салют 7',
      picture: 'images/poster-3.jpg',
      voteAverage: 30.0,
      releaseDate: '30.11.2023',
      description: 'Описание скоро будет...',
      language: Language.russian
  ),
  Movie(
      id: '4',
      title: 'Поймай меня, если сможешь',
      picture: 'images/poster-4.jpg',
      voteAverage: 40.0,
      releaseDate: '04.12.2023',
      description: 'Описание скоро будет...',
      language: Language.russian
  ),
];

enum Language {
  russian,
  english
}

mixin Converter {
  stringToEnum(String language) {
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

List<Movie> filterMovie(List<Movie> movies) {
  return movies.where((movie) => movie.voteAverage > 20).toList();
}