import 'package:flutter/material.dart';

class WeatherHourWidget extends StatelessWidget {
  const WeatherHourWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _TextWeatherWidget(text: "15:00"),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Image(image: AssetImage('assets/sun_min.png')),
          ),
          _TextWeatherWidget(text: "23º"),
        ],
      ),
    );
  }
}

class _TextWeatherWidget extends StatelessWidget {
  final String text;
  const _TextWeatherWidget({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.white
      )
    );
  }
}
