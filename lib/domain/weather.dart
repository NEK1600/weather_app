abstract interface class Weather {
  String day();
  List<String> times();
  List<String> temps();
  List<String> icons();

}

abstract interface class HourWeather {
  String humidityCharacter();
  String windCharacter();
  String icon();
}

class WeatherBase implements Weather {
  final String timezone;
  final List<HourWeather> hourly;

  const WeatherBase({
    required this.hourly,
    required this.timezone
  });

  @override
  String day() {
    List months =
    ['jan', 'feb', 'mar', 'apr', 'may','jun','jul','aug','sep','oct','nov','dec'];
    final date = DateTime.fromMillisecondsSinceEpoch((hourly[0] as HourWeatherBase).dt * 1000, isUtc: true);
    final day = date.day;
    final month = date.month;
    return "$day ${months[month-1]}";
  }

  @override
  List<String> icons() {
    List<String> list = [];
    hourly.map((item) => list.add(item.icon())).toList();
    return list;
  }

  @override
  List<String> temps() {
    List<String> list = [];
    hourly.map((item) {
      item as HourWeatherBase;
      final data = item.temp - 273.15;
      list.add(data.toInt().toString());
    }).toList();
    return list;
  }

  @override
  List<String> times() {
    List<String> list = [];
    hourly.map((item) {
      item as HourWeatherBase;
      final date = DateTime.fromMillisecondsSinceEpoch(item.dt * 1000, isUtc: true);
      list.add("${date.hour.toInt().toString()}:00");
    }).toList();
    return list;
  }
}

class HourWeatherBase implements HourWeather {
  final int dt;
  final double temp;
  final int humidity;
  final double windSpeed;
  final String main;
  const HourWeatherBase({
    required this.dt,
    required this.temp,
    required this.humidity,
    required this.windSpeed,
    required this.main,
  });

  @override
  String humidityCharacter() {
    if(humidity > 90) {
      return "высокая влажность";
    } else {
      return "низкая влажность";
    }
  }

  @override
  String windCharacter() {
    if(windSpeed > 3) {
      return "сильный ветер";
    } else {
      return "слабый ветер";
    }
  }

  @override
  String icon() {
    if(main == "Clouds") {
      return "cloudy";
    } else if(main == "Thunderstorm") {
      return "thunderstorm";
    } else {
      return "sun";
    }
  }
}
