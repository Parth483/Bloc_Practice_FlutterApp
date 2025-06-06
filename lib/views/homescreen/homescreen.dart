import 'package:blocstructure/components/parentwidget/customparentbackground.dart';
import 'package:blocstructure/components/widgets/internet_exception_widget.dart';
import 'package:blocstructure/execeptions/app_exception.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return CustomParentScaffold(
      onWillPop: () {
        return Future.value(false);
      },
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          throw NoInternetExecption('');
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InternetExceptionWidget(
            onPressed: () {
              print('object');
            },
          ),
          // LoadingWidget(size: 30.sp),
          // getDynamicSizedBox(height: 2.h),
          // Center(child: Text('HomeScreen')),
          // RoundButton(
          //   title: 'HomeScreen',
          //   onPressed: () {
          //     print('tap');
          //   },
          // ),
        ],
      ),
    );
  }
}
