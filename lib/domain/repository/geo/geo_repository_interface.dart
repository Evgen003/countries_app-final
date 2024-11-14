import 'dart:async';
import 'package:countries_app/domain/domain.dart';

abstract class GeoRepositoryInterface {
  Future<List<Article>> getCountries();
  Future<List<Article>> getCountriesAdd(int add);
  Future<List<Article>> getCountriesBack(int back);
}
