part of 'auth_bloc_bloc.dart';

abstract class AuthBlocEvent extends Equatable {
  const AuthBlocEvent();

  @override
  List<Object> get props => [];
}

class SignUp extends AuthBlocEvent {
  final String username, phone, password;

  const SignUp(
      {required this.username, required this.password, required this.phone});
}

class Login extends AuthBlocEvent {
  final String phone, password;

  const Login({required this.password, required this.phone});
}

class CheckAuth extends AuthBlocEvent {}
