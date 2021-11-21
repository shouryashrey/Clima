import 'location.dart';
import 'network.dart';

const url = 'https://api.openweathermap.org/data/2.5/weather?';
const apiKey = 'bd6b55b217a293e0e25dfa4ed9e29c43';

class Weather {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCoordinates();

    Network network = Network(
        url:
            '${url}lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await network.getData();

    return weatherData;
  }

  Future<dynamic> getCityWeather(String city) async {
    Network network = Network(url: '${url}q=$city&appid=$apiKey&units=metric');
    var weatherData = await network.getData();

    return weatherData;
  }
}
