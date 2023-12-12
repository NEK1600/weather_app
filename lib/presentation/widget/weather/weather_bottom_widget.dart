import 'package:flutter/material.dart';

class WeatherBottomWidget extends StatelessWidget {
  final String weather;
  final String specifications;
  const WeatherBottomWidget({super.key,
    required this.weather,
    required this.specifications,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0x33FFFFFF).withOpacity(0.3),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.cloud, color: Colors.white,),
              const SizedBox(width: 6),
              Text(weather, style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0x33FFFFFF)
              )),
              const SizedBox(width: 6),
              Text(specifications, style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.white
              )),
            ],
          )
        ],
      ),
    );
  }
}
