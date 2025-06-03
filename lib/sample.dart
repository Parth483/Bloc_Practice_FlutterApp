import 'package:blocstructure/components/parentwidget/customparentbackground.dart';
import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
  const Sample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomParentScaffold(
      onWillPop: () {
        return Future.value(false);
      },

      body: Center(),
    );
  }
}
