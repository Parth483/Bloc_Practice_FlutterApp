import 'package:blocstructure/components/parentwidget/customparentbackground.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return CustomParentScaffold(
      onWillPop: () {
        return Future.value(false);
      },
      body: Center(child: Text('Login Screen')),
    );
  }
}
