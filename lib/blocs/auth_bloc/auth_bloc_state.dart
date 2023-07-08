part of 'auth_bloc_bloc.dart';

abstract class AuthBlocState extends Equatable {
  const AuthBlocState();

  @override
  List<Object> get props => [];
}

class AuthUninitialized extends AuthBlocState {}

class AuthLoading extends AuthBlocState {}

class AuthAuthenticated extends AuthBlocState {}

class AuthUnauthenticated extends AuthBlocState {}

class AuthError extends AuthBlocState {
  final String error;

  const AuthError({required this.error});
}
