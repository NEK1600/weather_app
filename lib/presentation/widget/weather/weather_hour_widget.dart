import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/view_model/state_page/weather_page_state.dart';
import 'package:weather_app/presentation/view_model/weather_page_cubit.dart';

class WeatherHourWidget extends StatelessWidget {
  final int index;
  const WeatherHourWidget({super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final stateWeather = context.read<WeatherPageCubit>().weatherState() as WeatherPageStateBase;
    final stateData = stateWeather.stateHour.uiData();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _TextWeatherWidget(text: stateData.times[index]),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Image(image: AssetImage('assets/${stateData.icons[index]}.png')),
          ),
          _TextWeatherWidget(text: "${stateData.temps[index]}º"),
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
