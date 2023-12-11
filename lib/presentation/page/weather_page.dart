import 'package:flutter/material.dart';
import 'package:weather_app/presentation/widget/weather/weather_bottom_widget.dart';
import 'package:weather_app/presentation/widget/weather/weather_hour_widget.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              const Row(
                children: [
                  Icon(Icons.location_on, color: Colors.white),
                  SizedBox(width: 5),
                  Text("город, Страна", style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  )),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image(image: AssetImage('assets/thunderstorm_up.png')),
                  ),
                  Text("23º", style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 64
                  ),),
                  Text("гроза", style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400
                  ),),
                  Text("Макс:31ºМин:25º", style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400
                  )),
                  SizedBox(height: 10),
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
                              Text("20 марта",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(height: 3, color: Colors.white),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            WeatherHourWidget(),
                            WeatherHourWidget(),
                            WeatherHourWidget(),
                            WeatherHourWidget(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  WeatherBottomWidget(
                    weather: "Ветер северо-восточный",
                    specifications: "2 м/с",
                  ),
                  WeatherBottomWidget(
                    weather: 'Высокая влажность',
                    specifications: '100%',
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

class ChangeState