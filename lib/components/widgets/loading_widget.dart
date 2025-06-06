import 'dart:io';
import 'package:blocstructure/configs/colors_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final double size;
  const LoadingWidget({super.key, required this.size});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size,
      width: widget.size,
      child:
          Platform.isAndroid
              ? const CircularProgressIndicator(color: blue)
              : const CupertinoActivityIndicator(color: blue),
    );
  }
}
