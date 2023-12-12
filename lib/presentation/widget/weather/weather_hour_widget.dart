import 'package:flutter/material.dart';
import 'package:weather_app/core/page_state.dart';
import 'package:weather_app/presentation/view_model/state_page/weather_page_state.dart';

class WeatherHourWidget extends StatelessWidget {
  final int index;
  final DataStateHour data;
  const WeatherHourWidget({super.key,
    required this.index,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _TextWeatherWidget(text: data.times[index]),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Image(image: AssetImage('assets/${data.icons[index]}.png')),
          ),
          _TextWeatherWidget(text: "${data.temps[index]}º"),
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
