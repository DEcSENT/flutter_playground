/*
 * Copyright (c) 2019 by Denis Verentsov (decsent@yandex.ru)
 * All rights reserved.
 */

class LocationDataContainer {
  double lat;
  double lon;
  double alt;

  // Keys for Location library result parsing
  static const LATITUDE_KEY = "latitude";
  static const LONGITUDE_KEY = "longitude";
  static const ALTITUDE_KEY = "altitude";

  LocationDataContainer(double lat, double lon, double alt) {
    this.lat = lat;
    this.lon = lon;
    this.alt = alt;
  }

  static LocationDataContainer convertFromMap(Map<String, double> map) {
    return LocationDataContainer(
        map[LATITUDE_KEY], map[LONGITUDE_KEY], map[ALTITUDE_KEY]);
  }

  String getLatitude() {
    return lat.toString();
  }

  String getLongitude() {
    return lon.toString();
  }

  @override
  String toString() {
    return LATITUDE_KEY +
        ' ' +
        getLatitude() +
        ' ' +
        LONGITUDE_KEY +
        ' ' +
        getLongitude();
  }
}
