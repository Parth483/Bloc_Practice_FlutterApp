import 'package:blocstructure/bloc/login/login_bloc.dart';
import 'package:blocstructure/bloc/login/login_event.dart';
import 'package:blocstructure/bloc/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailInputWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final focuNode;
  const EmailInputWidget({super.key, this.focuNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (previous, current) => current.email != previous.email,
      builder: (context, state) {
        return TextFormField(
          focusNode: focuNode,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Email',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChanged(email: value));
          },

          validator: (value) {
            final emailRegex = RegExp(
              r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)+$',
            );
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }

            if (!emailRegex.hasMatch(value)) {
              return 'please enter valid email id';
            }
            return null;
          },
        );
      },
    );
  }
}
