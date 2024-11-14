import 'package:countries_app/data/endpoints.dart';
import 'package:countries_app/di/di.dart';
import 'package:dio/dio.dart';

import '../../domain.dart';

class ChangePage {
  Future<List<Article>> getCountriesAdd(String add) async {
    try {
      final Response response = await dio.get(
        Endpoints.countries,
        queryParameters: {
          'languageCode': 'ru',
          'limit': '10',
          'offset': add,
        },
      );
      final news = (response.data['data'] as List)
          .map((e) => Article.fromJson(e))
          .toList();
      return news;
    } on DioException catch (e) {
      throw e.message.toString();
    }
  }

  Future<List<Article>> getCountriesBack(String back) async {
    try {
      final Response response = await dio.get(
        Endpoints.countries,
        queryParameters: {
          'languageCode': 'ru',
          'limit': '10',
          'offset': '0',
        },
      );
      final news = (response.data['data'] as List)
          .map((e) => Article.fromJson(e))
          .toList();
      return news;
    } on DioException catch (e) {
      throw e.message.toString();
    }
  }
}
