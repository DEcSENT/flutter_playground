/*
 * Copyright (c) 2019 by Denis Verentsov (decsent@yandex.ru)
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter_playground/common/navigation/ScreenKey.dart';
import 'package:flutter_playground/presentation/main/MainScreen.dart';
import 'package:flutter_playground/presentation/splash/SplashScreen.dart';

class Router {
  static Map<String, WidgetBuilder> createMagicRoutes() {
    return {
      ScreenKey.MAIN_SCREEN: (BuildContext context) => MainScreen(),
      ScreenKey.SPLASH_SCREEN: (BuildContext context) => SplashScreen()
    };
  }
}
