part of 'auth_bloc.dart';



abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInRequested extends AuthEvent {
  final String username;
  final String password;

  SignInRequested({required this.username, required this.password});
}