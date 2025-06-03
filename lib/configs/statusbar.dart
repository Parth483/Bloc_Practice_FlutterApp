
import 'package:blocstructure/configs/colors_constant.dart';
import 'package:flutter/services.dart';

class Statusbar {
  void trasparentStatusbar({isblack = true}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: isblack ? Brightness.dark : Brightness.light,
        statusBarColor: isblack ? transparent : darkBackgroundColor,
        statusBarBrightness: isblack ? Brightness.dark : Brightness.light,
      ),
    );
  }
}
