


import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repositories/auth_repo.dart';
part 'auth_event.dart';
part 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository = AuthRepository();

  AuthBloc() : super(AuthInitial()) {
    on<SignInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final accessToken = await _authRepository.login(
            event.username,
            event.password
        );
        emit(AuthSuccess(accessToken.toString()));
      } catch (e) {

        log('SignIn error: $e');
        emit(AuthFailure(e.toString()));
      }
    });
  }
}