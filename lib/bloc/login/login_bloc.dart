import 'package:bloc/bloc.dart';
import 'package:blocstructure/bloc/login/login_event.dart';
import 'package:blocstructure/bloc/login/login_state.dart';
import 'package:blocstructure/repository/auth/login_repository.dart';
import 'package:blocstructure/utils/enums.dart';

class LoginBloc extends Bloc<LoginEvent, LoginStates> {
  LoginRepository _loginRepository = LoginRepository();

  LoginBloc() : super(const LoginStates()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginBtnPressed>(_onLoginBtnPressed);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginStates> emit) {
    print(event.email);
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginStates> emit) {
    print(event.password);
    emit(state.copyWith(password: event.password));
  }

  void _onLoginBtnPressed(
    LoginBtnPressed event,
    Emitter<LoginStates> emit,
  ) async {
    Map data = {"email": state.email, "password": state.password};
    // Map data = {"email": "eve.holt@reqres.in", "password": "cityslicka"};

    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    await _loginRepository
        .loginApi(data)
        .then((value) {
          if (value.error.isNotEmpty) {
            emit(
              state.copyWith(
                message: value.error.toString(),
                postApiStatus: PostApiStatus.error,
              ),
            );
          } else {
            emit(
              state.copyWith(
                message: 'Login Successfull',
                postApiStatus: PostApiStatus.success,
              ),
            );
          }
        })
        .onError((error, statckTrace) {
          emit(
            state.copyWith(
              message: error.toString(),
              postApiStatus: PostApiStatus.error,
            ),
          );
        });
  }
}
