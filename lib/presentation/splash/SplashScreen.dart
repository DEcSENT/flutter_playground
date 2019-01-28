/*
 * Copyright (c) 2019 by Denis Verentsov (decsent@yandex.ru)
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter_playground/common/navigation/ScreenKey.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    startTimeout(context);
    return Container(
      color: Colors.red,
    );
  }

  startTimeout(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000), () {
      handleTimeout(context);
    });
  }

  void handleTimeout(BuildContext context) {
    Navigator.pushReplacementNamed(context, ScreenKey.MAIN_SCREEN);
  }
}
