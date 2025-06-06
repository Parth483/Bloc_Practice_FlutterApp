import 'package:blocstructure/utils/enums.dart';
import 'package:equatable/equatable.dart';

class LoginStates extends Equatable {
  final String email;
  final String password;
  final PostApiStatus postApiStatus;
  final String message;
  const LoginStates({
    this.postApiStatus = PostApiStatus.intial,
    this.message = '',
    this.password = '',
    this.email = '',
  });

  LoginStates copyWith({
    String? email,
    String? password,
    String? message,
    PostApiStatus? postApiStatus,
  }) {
    return LoginStates(
      password: password ?? this.password,
      email: email ?? this.email,
      message: message ?? this.message,
      postApiStatus: postApiStatus ?? this.postApiStatus,
    );
  }

  @override
  List<Object?> get props => [email, password, message, postApiStatus];
}
