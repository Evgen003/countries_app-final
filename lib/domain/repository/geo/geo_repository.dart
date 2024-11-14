import 'dart:async';
import 'package:dio/dio.dart';
import 'package:countries_app/data/data.dart';
import 'package:countries_app/domain/domain.dart';

class GeoRepository extends GeoRepositoryInterface {
  GeoRepository({required this.dio});
  int offset = 0;
  final Dio dio;
  @override
  Future<List<Article>> getCountries() async {
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

  @override
  Future<List<Article>> getCountriesAdd(int add) async {
    try {
      offset += add;
      final Response response = await dio.get(
        Endpoints.countries,
        queryParameters: {
          'languageCode': 'ru',
          'limit': '10',
          'offset': offset.toString(),
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

  @override
  Future<List<Article>> getCountriesBack(int back) async {
    try {
      offset -= back;
      if (offset < 0) offset = 0;
      final Response response = await dio.get(
        Endpoints.countries,
        queryParameters: {
          'languageCode': 'ru',
          'limit': '10',
          'offset': offset.toString(),
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
