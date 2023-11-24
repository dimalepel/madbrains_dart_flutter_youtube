class MovieQuery {
  static const String baseUrl = 'https://api.kinopoisk.dev/v1.4/movie';
  static const String mockUrl =
      'https://gist.githubusercontent.com/dimalepel/3924cc9522d2ee40ffee9a3a333c07e9/raw/106adcc692f636afaf197dae7d48ac5e21f08309/kinopoisk_dev_api.json';

  static const String apiKey = '773X2BF-VRPMMPQ-QJNB6ES-T4RRA4G';
  static Map<String, dynamic> headers = {
    'X-API-KEY': MovieQuery.apiKey,
  };
  static Map<String, dynamic> queryParameters = {
    'year': 2023,
  };
}
