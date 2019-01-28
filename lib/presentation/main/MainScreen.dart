/*
 * Copyright (c) 2019 by Denis Verentsov (decsent@yandex.ru)
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter_playground/widgets/location/LocationProvider.dart';

class MainScreen extends StatelessWidget {
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
                onPressed: _onPressLocationButton,
                splashColor: Colors.redAccent,
              ),
              LocationProvider(
                //TODO: refactor
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onPressLocationButton() {

  }
}
