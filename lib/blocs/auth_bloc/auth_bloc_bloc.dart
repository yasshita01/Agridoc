import 'dart:developer';

import 'package:agridoc/repository/handlers/user_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final UserRepository _userRepository = UserRepository();

  AuthBloc() : super(AuthUninitialized()) {
    on<AuthBlocEvent>((event, emit) async {
      emit(AuthLoading());
      if (event is SignUp) {
        try {
          bool isDone = await _userRepository.signUp(
              event.username, event.phone, event.password);
          if (isDone) {
            emit(AuthAuthenticated());
          } else {
            emit(AuthUnauthenticated());
          }
        } catch (e) {
          emit(const AuthError(error: "Something went wrong"));
        }
      }

      if (event is CheckAuth) {
        if (await _userRepository.hasToken()) {
          log((await _userRepository.hasToken()).toString());
          emit(AuthAuthenticated());
          return;
        } else {
          emit(AuthUnauthenticated());
        }
      }

      if (event is Login) {
        try {
          bool isLogin =
              await _userRepository.login(event.phone, event.password);
          if (isLogin) {
            emit(AuthAuthenticated());
          } else {
            throw Exception();
          }
        } catch (e) {
          emit(const AuthError(error: "Login failed"));
        }
      }
    });
  }
}
