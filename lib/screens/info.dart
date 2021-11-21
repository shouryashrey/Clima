import 'package:flutter/material.dart';
import 'package:weather_app/screens/search.dart';

const url = 'https://api.openweathermap.org/data/2.5/weather?';
const apiKey = 'bd6b55b217a293e0e25dfa4ed9e29c43';

// ignore: must_be_immutable
class InfoScreen extends StatefulWidget {
  InfoScreen({this.weatherData});

  var weatherData;

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  String cityName,
      temp,
      maxTemp,
      minTemp,
      condition,
      visibility,
      humidity,
      tempFelt,
      airPressure,
      windSpeed;
  Image img;

  void updateData(dynamic data) {
    if (data == null) {
      cityName = "Error";
    } else {
      cityName = data['name'];
      temp = data['main']['temp'].toString();
      condition = data['weather'][0]['main'].toString();
      maxTemp = data['main']['temp_max'].toString();
      minTemp = data['main']['temp_max'].toString();
      visibility = data['visibility'].toString();
      humidity = data['main']['humidity'].toString();
      tempFelt = data['main']['feels_like'].toString();
      airPressure = data['main']['pressure'].toString();
      windSpeed = data['wind']['speed'].toString();
      img = Image.network(
          'http://openweathermap.org/img/wn/${widget.weatherData['weather'][0]['icon']}@2x.png');
    }
  }

  @override
  void initState() {
    super.initState();
    updateData(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Weather'),
            Text(
              'App',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 15),
            child: Text(
              cityName,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: img,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  offset: Offset(0.0, 1.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      '$temp',
                      style: TextStyle(
                        fontSize: 55.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF23026A),
                      ),
                    ),
                    Text(
                      '°C',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF23026A),
                      ),
                    )
                  ],
                ),
                Text(
                  condition,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF23026A),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black87,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    DetailColumn(
                      title: '$minTemp/$maxTemp °C',
                      subTitle: 'Min/Max Temp',
                    ),
                    DetailColumn(
                      title: '$tempFelt °C',
                      subTitle: 'Temperature Felt',
                    ),
                    DetailColumn(
                      title: '$airPressure hPa',
                      subTitle: 'Air Pressure',
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    DetailColumn(
                      title: '$humidity %',
                      subTitle: 'Humidity',
                    ),
                    DetailColumn(
                      title: '$windSpeed m/s',
                      subTitle: 'Wind Speed',
                    ),
                    DetailColumn(
                      title: '$visibility m',
                      subTitle: 'Visibility',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailColumn extends StatelessWidget {
  DetailColumn({this.title, this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.03,
          ),
          Text(
            subTitle,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
