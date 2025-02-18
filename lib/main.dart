import 'package:flutter/material.dart';
import 'package:countries_app/di/di.dart';
import 'package:countries_app/countries_app.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  FlutterError.onError = (details) => talker.handle(
        details.exception,
        details.stack,
      );

  runApp(const CountriesApp());
}
