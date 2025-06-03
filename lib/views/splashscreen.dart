import 'package:blocstructure/components/parentwidget/customparentbackground.dart';
import 'package:blocstructure/configs/routes/route_name.dart';
import 'package:blocstructure/configs/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteName.homeScreen,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentScaffold(
      onWillPop: () {
        return Future.value(false);
      },
      body: Center(
        child: Text(
          'SplashScreen',
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
