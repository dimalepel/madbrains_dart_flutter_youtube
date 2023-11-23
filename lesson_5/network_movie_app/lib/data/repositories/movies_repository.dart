import 'package:dio/dio.dart';
import 'package:network_movie_app/components/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../domain/models/home_model.dart';

class MoviesRepository {
  static final Dio _dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

  static Future<HomeModel?> loadData() async {
    try {
      await _dio.get(MovieQuery.mockUrl);
    } catch (e) {
      print(e);
    }
  }
}
