import 'package:equatable/equatable.dart';

enum LoginStatus { intial, loading, sucess, error }

class LoginState extends Equatable {
  final String message;
  final String email;
  final String password;
  final LoginStatus loginStatus;
  final bool isPasswordObsecure;
  const LoginState({
    this.email = '',
    this.password = '',
    this.message = '',
    this.loginStatus = LoginStatus.intial,
    this.isPasswordObsecure = true,
  });
  LoginState copyWith({
    String? message,
    String? email,
    String? password,
    LoginStatus? loginStatus,
    bool? isPasswordObsecure,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      loginStatus: loginStatus ?? this.loginStatus,
      isPasswordObsecure: isPasswordObsecure ?? this.isPasswordObsecure,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    message,
    email,
    password,
    loginStatus,
    isPasswordObsecure,
  ];
}
