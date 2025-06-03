import 'dart:async';

import 'package:blocstructure/configs/routes/route_name.dart';
import 'package:flutter/widgets.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        RouteName.loginScreen,
        (route) => false,
      ),
    );
  }
}
