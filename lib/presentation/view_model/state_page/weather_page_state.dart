



class WeatherUiData {
  final String location;
  final String bigBaseIcon;
  final List<WeatherHour> weatherHours;
  final String currentWeather;
  final Wind wind;
  final Humidity humidity;

  WeatherUiData({
    required this.location,
    required this.bigBaseIcon,
    required this.weatherHours,
    required this.currentWeather,
    required this.wind,
    required this.humidity,
  });

}
