import 'package:blocstructure/bloc/login/login_bloc.dart';
import 'package:blocstructure/bloc/login/login_event.dart';
import 'package:blocstructure/bloc/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordInputWidget extends StatelessWidget {
  final passNode;
  const PasswordInputWidget({super.key, this.passNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (previous, current) => current.password != previous.password,
      builder: (context, state) {
        return TextFormField(
          focusNode: passNode,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Password',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChanged(password: value));
          },

          validator: (value) {

            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }

            if (value.length < 6) {
              return 'please enter password greater than 6 char';
            }

         
            return null;
          },
        );
      },
    );
  }
}
