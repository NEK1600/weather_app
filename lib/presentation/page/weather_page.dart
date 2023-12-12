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
    final stateWeather = context.read<WeatherPageCubit>().weatherState() as WeatherPageStateBase;
    final stateCity = stateWeather.stateCity;
    final stateBase = stateWeather.stateBase;
    final stateBottom = stateWeather.stateBottom;
    final stateHour = stateWeather.stateHour;
    return Container(
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
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.white),
                  const SizedBox(width: 5),
                  ChangeStateBase(
                    listenable: stateCity,
                    widgetBase: Text(stateCity.uiData().city, style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    )),
                  ),
                ],
              ),
              Column(
                children: [
                  ChangeStateBase(
                    listenable: stateBase,
                    widgetBase: Column(
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
                        Text("${stateBase.uiData().baseWeather}", style: const TextStyle(
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
                    )
                  ),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Сегодня",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.white,
                                )),
                              ChangeStateBase(
                                  listenable: stateHour,
                                  widgetBase: Text(stateHour.uiData().date,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                      color: Colors.white,
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(height: 3, color: Colors.white),
                        const SizedBox(height: 10),
                        ChangeStateBase(
                            listenable: stateHour,
                            widgetBase: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WeatherHourWidget(index: 0),
                                WeatherHourWidget(index: 1),
                                WeatherHourWidget(index: 2),
                                WeatherHourWidget(index: 3),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  ChangeStateBase(
                      listenable: stateBottom,
                      widgetBase: Column(
                        children: [
                          WeatherBottomWidget(
                            weather: stateBottom.uiData().windCharacter,
                            specifications: stateBottom.uiData().wind,
                          ),
                          WeatherBottomWidget(
                            weather: stateBottom.uiData().humidityCharacter,
                            specifications: stateBottom.uiData().humidity,
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ],
          ),
        ]
      ),
    );
  }
}

class ChangeStateBase extends StatelessWidget {
  final PageState listenable;
  final Widget widgetBase;
  const ChangeStateBase({super.key,
    required this.listenable,
    required this.widgetBase,
  });
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: listenable,
        builder: (context, widget) {
          if(listenable.emptyState()) {
            return Container(
              height: 10,
              color: Colors.black,
            );
          }
          return widgetBase;
        }
    );
  }
}
