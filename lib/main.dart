import 'package:flutter/material.dart';
import 'package:countries_app/di/di.dart';
import 'package:countries_app/countries_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  FlutterError.onError = (details) => talker.handle(
        details.exception,
        details.stack,
      );
  runApp(const CountriesApp());
}
