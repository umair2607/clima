import 'package:clima/services/networking.dart';
import '../services/location.dart';

const String apiKey = 'a1fcda43d56ae6c3d755de2a5f4f15d8';
const String openWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityname) async {
    var url = '$openWeatherUrl?q=$cityname&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherdata = await networkHelper.getData();
    return weatherdata;
  }

  Future<dynamic> getLocationWeather() async {
    Location myLocation = Location();
    await myLocation.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherUrl?lat=${myLocation.latitute}&lon=${myLocation.longitute}&appid=$apiKey&units=metric');

    final weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
