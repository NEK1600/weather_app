class FakeWeather {
  Weather weather() {
    return Weather(
      timezone: "America/Chicago",
      hourly: [
        WeatherHour(
          hout: "15:00",
          temp: "15",
          main: "Clouds",

        ),
        WeatherHour(
          hout: "16:00",
          temp: "15"
        ),
        WeatherHour(
          hout: "17:00",
          temp: "15"
        ),
        WeatherHour(
          hout: "18:00",
          temp: "15"
        ),
      ],
    );
  }
}