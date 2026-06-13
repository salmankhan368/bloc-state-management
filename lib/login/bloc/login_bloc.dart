import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:my_bloc/login/bloc/login_event.dart';
import 'package:my_bloc/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<EmailChanged>(_onEmailChange);
    on<PasswordChange>(_onPasswordChange);
    on<LoginApi>(_loginApi);
    on<TogglePassword>(_togglePassword);
  }
  void _onEmailChange(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChange(PasswordChange event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _togglePassword(TogglePassword event, Emitter<LoginState> emit) {
    emit(state.copyWith(isPasswordObsecure: !state.isPasswordObsecure));
  }

  Future<void> _loginApi(LoginApi event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    final data = {'email': state.email, 'password': state.password};
    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        headers: {
          'Content-Type': 'application/json',

          'x-api-key': 'reqres_d2660749b7534be5ad6c5a2f55cd27ad',
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            loginStatus: LoginStatus.sucess,
            message: 'Login Scuccesfully',
          ),
        );
      } else {
        emit(
          state.copyWith(
            loginStatus: LoginStatus.error,
            message: 'Opps something went wrong',
          ),
        );
      }
    } catch (e) {
      print(e.toString());
      emit(
        state.copyWith(loginStatus: LoginStatus.error, message: e.toString()),
      );
    }
  }
}
