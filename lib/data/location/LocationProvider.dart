/*
 * Copyright (c) 2019 by Denis Verentsov (decsent@yandex.ru)
 * All rights reserved.
 */

import 'dart:async';

import 'package:flutter_playground/data/location/LocationDataContainer.dart';
import 'package:location/location.dart';

class LocationProvider {
  Location _location = new Location();

  Future<LocationDataContainer> getCurrentLocation() async {
    // Permission request is broken...
    await _location.hasPermission();
    return await _location
        .getLocation()
        .then((onValue) => LocationDataContainer.convertFromMap(onValue));
  }
}
