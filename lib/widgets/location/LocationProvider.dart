/*
 * Copyright (c) 2019 by Denis Verentsov (decsent@yandex.ru)
 * All rights reserved.
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_playground/widgets/location/LocationData.dart';
import 'package:location/location.dart';

/// Widget which provides Location updates from platform call.
/// Part of code was taken from https://pub.dartlang.org/packages/location#-example-tab-
class LocationProvider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LocationProviderState();
  }
}

class LocationProviderState extends State<LocationProvider> {
  LocationData locationData;

  StreamSubscription<Map<String, double>> _locationSubscription;

  Location _location = new Location();
  bool _permission = false;
  String error;

  @override
  void initState() {
    super.initState();

    initPlatformState();

    _locationSubscription =
        _location.onLocationChanged().listen((Map<String, double> result) {
      setState(() {
        locationData = LocationData.convertFromMap(result);
        print(locationData);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _locationSubscription.cancel();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    Map<String, double> location;
    // Platform messages may fail, so we use a try/catch PlatformException.

    try {
      _permission = await _location.hasPermission();
      location = await _location.getLocation();
      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error =
            'Permission denied - please ask the user to enable it from the app settings';
      }

      location = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //if (!mounted) return;

    setState(() {
      locationData = LocationData.convertFromMap(location);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = new List();

    widgets.add(new Center(
        child: new Text(locationData != null
            ? 'Start latitude: ' + locationData.getLatitude() +  '\n' + 'Start longitude: ' + locationData.getLongitude() +  '\n'
            : 'Error: $error\n')));

    widgets.add(new Center(
        child: new Text(locationData != null
            ? 'Latitude: ' + locationData.lat.toString() + '\n' + 'Longutude: ' + locationData.lon.toString()
            : 'Error: $error\n')));

    widgets.add(new Center(
        child: new Text(
            _permission ? 'Has permission : Yes' : "Has permission : No")));

    return new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: widgets,
      ),
    );
  }
}
