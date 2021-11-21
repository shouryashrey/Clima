import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'info.dart';
import 'package:weather_app/services/weather.dart';

// ignore: must_be_immutable
class Loading extends StatefulWidget {
  Loading({this.cityName, this.flag});

  String cityName;
  String flag;

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    if (widget.flag == 'location')
      getLocationData();
    else if (widget.flag == 'city') getCityData(widget.cityName);
  }

  void getLocationData() async {
    var weatherData = await Weather().getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InfoScreen(
          weatherData: weatherData,
        ),
      ),
    );
  }

  void getCityData(String cityName) async {
    var weatherData = await Weather().getCityWeather(cityName);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InfoScreen(
          weatherData: weatherData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          size: 100.0,
          color: Color(0xFFF2954E),
        ),
      ),
    );
  }
}
