/*
 * Copyright (c) 2019 by Denis Verentsov (decsent@yandex.ru)
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter_playground/data/location/LocationProvider.dart';
import 'package:flutter_playground/data/location/LocationDataContainer.dart';
import 'package:flutter_playground/data/weather/WeatherHttpProvider.dart';

class MainScreen extends StatelessWidget {
  
  final httpCallProvider = new WeatherApiProvider();

  final locationProvider = new LocationProvider();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  "Main screen"
              ),
              MaterialButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: new Text(
                  "Find my location",
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.yellow,
                  ),
                ),
                onPressed: _onPressCurrentLocationButton,
                splashColor: Colors.redAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressCurrentLocationButton() {
    locationProvider.getCurrentLocation()
        .then((currentLocation) {
      print(currentLocation);
      _loadWeatherByCoordinates(currentLocation);
    })
        .catchError((onError) {
      print(onError);
    });
  }

  void _loadWeatherByCoordinates(LocationDataContainer locationData) {
    var weatherFuture = httpCallProvider.fetchWeatherByCoordinates(locationData.lat, locationData.lon);
    weatherFuture.then((onValue) {
      print(onValue.city.name);
      print(onValue.list[0].main.temp);
    })
        .catchError((onError) {
      print(onError);
    });
  }
}
