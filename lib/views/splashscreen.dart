import 'package:blocstructure/components/parentwidget/customparentbackground.dart';
import 'package:blocstructure/configs/routes/route_name.dart';
import 'package:blocstructure/services/splash/splash_services.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  SplashServices _splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _splashServices.isLogin(context);
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
