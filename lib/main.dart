import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/di/base_di.dart';
import 'package:weather_app/di/initial_app.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  BaseDi baseDi = BaseDi();
  await baseDi.init();
  runApp(InitialApp(baseDi: baseDi));
}
