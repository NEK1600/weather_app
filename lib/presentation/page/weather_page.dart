import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/page_state.dart';
import 'package:weather_app/di/base_provider.dart';
import 'package:weather_app/presentation/view_model/state_page/weather_page_state.dart';
import 'package:weather_app/presentation/view_model/weather_page_cubit.dart';
import 'package:weather_app/presentation/widget/weather/weather_bottom_widget.dart';
import 'package:weather_app/presentation/widget/weather/weather_hour_widget.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.getInheritedWidgetOfExactType<BaseProvider>()!.baseDi.weatherCubit();
    return BlocProvider(
      create: (_) => bloc..initialWeather(),
      child: const WeatherPageBase(),
    );
  }
}

class WeatherPageBase extends StatelessWidget {
  const WeatherPageBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home_screen.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          padding:const EdgeInsets.all(24),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.white),
                    SizedBox(width: 5),
                    _CityWidget(),
                  ],
                ),
                Column(
                  children: [
                    const _BaseWidget(),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: const Color(0x33FFFFFF).withOpacity(0.3),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Сегодня",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                      color: Colors.white,
                                  )),
                                _DayWidget(),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(height: 3, color: Colors.white),
                          const SizedBox(height: 10),
                          const _HourWidget(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const _BottomWidget(),
                  ],
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}

class _CityWidget extends StatelessWidget {
  const _CityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final stateWeather = context.read<WeatherPageCubit>().weatherState() as WeatherPageStateBase;
    final stateCity = stateWeather.stateCity;
    return ListenableBuilder(
        listenable: stateCity,
        builder: (context, widget) {
          return Text(stateCity.uiData().city, style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white
          )
          );
        }
    );
  }
}

class _DayWidget extends StatelessWidget {
  const _DayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final stateWeather = context.read<WeatherPageCubit>().weatherState() as WeatherPageStateBase;
    final stateHour = stateWeather.stateHour;
    return ListenableBuilder(
        listenable: stateHour,
        builder: (BuildContext context, Widget? child) {
          return Text(stateHour.uiData().date,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
                color: Colors.white,
              ));
        }
    );
  }
}

class _HourWidget extends StatelessWidget {
  const _HourWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final stateWeather = context.read<WeatherPageCubit>().weatherState() as WeatherPageStateBase;
    final stateHour = stateWeather.stateHour;
    return ListenableBuilder(
      listenable: stateHour,
      builder: (BuildContext context, Widget? child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WeatherHourWidget(index: 0, data: stateHour.uiData()),
            WeatherHourWidget(index: 1, data: stateHour.uiData()),
            WeatherHourWidget(index: 2, data: stateHour.uiData()),
            WeatherHourWidget(index: 3, data: stateHour.uiData()),
          ],
        );
      },
    );
  }
}

class _BottomWidget extends StatelessWidget {
  const _BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final stateWeather = context.read<WeatherPageCubit>().weatherState() as WeatherPageStateBase;
    final stateBottom = stateWeather.stateBottom;
    return ListenableBuilder(
      listenable: stateBottom,
      builder: (BuildContext context, Widget? child) {
        return Column(
          children: [
            WeatherBottomWidget(
              weather: stateBottom.uiData().wind,
              specifications: stateBottom.uiData().windCharacter,
            ),
            WeatherBottomWidget(
              weather: stateBottom.uiData().humidity,
              specifications: stateBottom.uiData().humidityCharacter,
            ),
          ],
        );
      },
    );
  }
}

class _BaseWidget extends StatelessWidget {
  const _BaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final stateWeather = context.read<WeatherPageCubit>().weatherState() as WeatherPageStateBase;
    final stateBase = stateWeather.stateBase;
    return ListenableBuilder(
        listenable: stateBase,
        builder: (context, widget) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Image(image: AssetImage('assets/${stateBase.uiData().baseIcon}.png')),
              ),
              Text("${stateBase.uiData().baseTemp}º", style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 64
              ),),
              Text(stateBase.uiData().baseWeather, style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400
              ),),
              const Text("Макс:31ºМин:25º", style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400
              )),
            ],
          );
        }
    );
  }
}
