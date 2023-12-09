import 'package:flutter/material.dart';
import 'package:weather_app/presentation/page/weather_page.dart';

class InitialApp extends StatelessWidget {
  const InitialApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: WeatherPage(),
      ),
    );
  }
}
