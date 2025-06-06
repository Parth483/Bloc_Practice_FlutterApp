import 'package:blocstructure/bloc/login/login_bloc.dart';
import 'package:blocstructure/bloc/login/login_event.dart';
import 'package:blocstructure/bloc/login/login_state.dart';
import 'package:blocstructure/components/button/form_button.dart';
import 'package:blocstructure/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginbtn extends StatelessWidget {
  final GlobalKey<FormState> formkey;
  const Loginbtn({super.key, required this.formkey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.error) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.message.toString())));
        }

        if (state.postApiStatus == PostApiStatus.success) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.message.toString())));
        }
        if (state.postApiStatus == PostApiStatus.loading) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text('submitinggg')));
        }
      },
      child: BlocBuilder<LoginBloc, LoginStates>(
        buildWhen: (previous, current) => false,
        builder: (context, state) {
          return getFormButton(
            context,
            () {
              final formState = formkey.currentState;
              if (formState != null && formState.validate()) {
                print('yellow');

                context.read<LoginBloc>().add(LoginBtnPressed());
              }
            },
            'Login',
            validate: true,
          );
        },
      ),
    );
  }
}
