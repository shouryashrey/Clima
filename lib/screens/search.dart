import 'package:flutter/material.dart';
import 'package:weather_app/screens/loading.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10.0)),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (newValue) {
                  search = newValue;
                },
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text(
                'Get Weather',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Loading(
                      cityName: search,
                      flag: 'city',
                    ),
                  ),
                );
              },
              elevation: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}
