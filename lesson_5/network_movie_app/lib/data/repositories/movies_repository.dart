import 'dart:math';

import 'package:dio/dio.dart';
import 'package:network_movie_app/components/constants.dart';
import 'package:network_movie_app/data/mappers/home_mapper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../domain/models/home_model.dart';
import '../dtos/home_dto.dart';

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
      const String url = MovieQuery.baseUrl;
      final Response<dynamic> response = await _dio.get(
        url,
        queryParameters: {
          'year': Random().nextInt(23) + 2000,
        },
        options: Options(
          headers: MovieQuery.headers,
        ),
      );

      //var json = jsonDecode(response.data); Если получаем данные из json файла, тогда нужно раскомментировать эту строку и заменить response.data -> json
      final HomeDTO dto =
          HomeDTO.fromJson(response.data as Map<String, dynamic>);

      final HomeModel model = dto.toDomain();

      return model;
    } catch (e) {
      //print(e);
    }
    return null;
  }
}
