/* 
 * 1. Создать абстрактный класс для фильма со следующими полями:
 * - String id;
 * - String title;
 * - String picture;
 * - double voteAverage;
 * - String releaseDate;
 * - String description;
 * - String language;
 * */
abstract class Cinema {
  String id;
  String title;
  String picture;
  double voteAverage;
  String releaseDate;
  String description;
  String language;
  
  Cinema({
    required this.id,
    required this.title,
    required this.picture,
    required this.voteAverage,
    required this.description,
    required this.releaseDate,
    required this.language
  });
}

/* 
 * 2. Создать обычный класс фильма и относледоваться от абстрактного.
 * */
class Movie extends Cinema with Converter {
  Movie({
    id,
    title,
    picture,
    voteAverage,
    releaseDate,
    description,
    language
  }) : super(
    id: id,
    title: title,
    picture: picture,
    voteAverage: voteAverage,
    description: description,
    releaseDate: releaseDate,
    language: language
  );
}

/* 
 * 3. Создать примесь для конвертации языка из строки в enum Language и добавить к классу.
 * */
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

/* 
 * 4. Создать расширение для Language с методом toPrettyString(), возвращающим строку с названием языка (например, Language.russian - "Русский", Language.english - "Английский").
 * */
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

/* 
 * 5. Создать асинхронную функцию, возвращающую список фильмов (сам список можно просто задавать напрямую).
 * */
List<Movie> movies = [    
  Movie(
    id: '1',
    title: 'Синий жук',
    picture: 'image/poster-1.jpg',
    voteAverage: 10,
    releaseDate: '10.11.2023',
    description: 'Описание скоро будет...',
    language: 'Русский'
  ),
  Movie(
    id: '2',
    title: 'Домашняя игра',
    picture: 'image/poster-2.jpg',
    voteAverage: 20,
    releaseDate: '20.11.2023',
    description: 'Описание скоро будет...',
    language: 'Английский'
  ),
  Movie(
    id: '3',
    title: 'Салют 7',
    picture: 'image/poster-3.jpg',
    voteAverage: 30,
    releaseDate: '30.11.2023',
    description: 'Описание скоро будет...',
    language: 'Русский'
  ),
  Movie(
    id: '4',
    title: 'Поймай меня, если сможешь',
    picture: 'image/poster-4.jpg',
    voteAverage: 40,
    releaseDate: '04.12.2023',
    description: 'Описание скоро будет...',
    language: 'Английский'
  ),
];

Future<List<Movie>> getMovies() async {
  return movies;
}

/* 
 * 6. Создать функцию для фильтрации фильмов по любому параметру (например, рейтинг).
 * */
List<Movie> filterMovie(List<Movie> movies) {
  return movies.where((movie) => movie.voteAverage > 20).toList();
}
