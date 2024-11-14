import 'dart:async';
import 'package:countries_app/domain/domain.dart';
import 'package:countries_app/domain/repository/model/details.dart';

abstract class CountryDetailsRepositoryInterface {
  Future<Details> getCountryDetails();
}
