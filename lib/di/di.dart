import 'package:countries_app/domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:countries_app/data/data.dart';
import 'package:countries_app/app/app.dart';

final GetIt getIt = GetIt.instance;
final Talker talker = TalkerFlutter.init();
final Dio dio = Dio();

Future<void> setupLocator() async {
  setUpDio();
  getIt.registerSingleton<Dio>(dio);
  getIt.registerSingleton<Talker>(talker);
  getIt.registerSingleton(GeoRepository(dio: getIt<Dio>()));
  getIt.registerSingleton(HomeBloc(getIt.get<GeoRepository>()));
  getIt.registerSingleton(CountryDetailsRepository(dio: getIt<Dio>()));
  getIt.registerSingleton(DetailsBloc(getIt.get<CountryDetailsRepository>()));
}
