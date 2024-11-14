import 'dart:async';
import 'package:dio/dio.dart';
import 'package:countries_app/data/data.dart';
import 'package:countries_app/domain/domain.dart';

class CountryDetailsRepository extends CountryDetailsRepositoryInterface {
  CountryDetailsRepository({required this.dio});
  final Dio dio;
  @override
  Future<Details> getCountryDetails() async {
    try {
      final Response response = await dio.get(
        Endpoints.countryDetails,
        queryParameters: {
          'languageCode': 'ru',
        },
      );

      final details = Details.fromJson(response.data['data']);
      return details;
    } on DioException catch (e) {
      throw e.message.toString();
    }
  }
}
