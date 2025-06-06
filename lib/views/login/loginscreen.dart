import 'package:blocstructure/bloc/login/login_bloc.dart';
import 'package:blocstructure/components/parentwidget/customparentbackground.dart';
import 'package:blocstructure/components/toolbar.dart/toolbar.dart';
import 'package:blocstructure/views/login/widgets/loginbtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:blocstructure/views/widgets.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  // UserModel _user = UserModel();
  late LoginBloc _loginBloc;

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentScaffold(
      onWillPop: () {
        return Future.value(false);
      },
      body: BlocProvider(
        create: (context) => _loginBloc,

        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EmailInputWidget(focuNode: emailFocusNode),
                getDynamicSizedBox(height: 2.h),
                PasswordInputWidget(passNode: passwordFocusNode),

                getDynamicSizedBox(height: 4.h),
                Loginbtn(formkey: _formKey),
              ],
            ),
          ),
        ),
      ),
      //  Form(
      //   key: _formKey,
      //   child: Container(
      //     padding: EdgeInsets.symmetric(horizontal: 5.w),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         EmailInputWidget(focuNode: emailFocusNode),
      //         getDynamicSizedBox(height: 2.h),
      //         PasswordInputWidget(passNode: passwordFocusNode),

      //         getDynamicSizedBox(height: 4.h),
      //         getFormButton(
      //           context,
      //           () {
      //             if (_formKey.currentState!.validate()) {
      //               print('yellow');
      //             }
      //           },
      //           'Login',
      //           validate: true,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
