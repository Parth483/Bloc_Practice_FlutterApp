import 'package:blocstructure/components/toolbar.dart/toolbar.dart';
import 'package:blocstructure/configs/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onPressed;
  const InternetExceptionWidget({super.key, required this.onPressed});

  @override
  State<InternetExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.cloud_off, size: 30.sp, color: red),

        Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: Center(
            child: Text(
              'We\'re unable to show results. \nPlease check your data \nconnection.',
              style: Theme.of(
                context,
              ).textTheme.displayMedium!.copyWith(fontSize: 18.sp),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 2.h),
        // SizedBox(height: MediaQuery.sizeOf(context).height * .30),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: widget.onPressed,
            child: Center(
              child: Text(
                'RETRY',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
