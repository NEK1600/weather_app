



class DataStateCity {
  final String city;
  DataStateCity({required this.city});
}

class DataStateBase {
  final String baseIcon;
  final int baseTemp;
  final String baseWeather;
  DataStateBase({
    required this.baseIcon,
    required this.baseTemp,
    required this.baseWeather,
  });
}

class DataStateHour {
  final String date;
  final List<String> icons;
  final List<String> times;
  final List<int> temps;
  DataStateHour({
    required this.date,
    required this.icons,
    required this.times,
    required this.temps,
  });
}

class DataStateBottom {
  final int wind;
  final String windCharacter;
  final int humidity;
  final String humidityCharacter;
  DataStateBottom({
    required this.wind,
    required this.windCharacter,
    required this.humidity,
    required this.humidityCharacter,
  });
}

class DataStateEmpty {}