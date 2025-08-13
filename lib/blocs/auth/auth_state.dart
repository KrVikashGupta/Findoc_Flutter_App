import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String email;

  const AuthSuccess(this.email);

  @override
  List<Object> get props => [email];
}

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);

  @override
  List<Object> get props => [message];
}

class AuthValidationError extends AuthState {
  final String? emailError;
  final String? passwordError;

  const AuthValidationError({
    this.emailError,
    this.passwordError,
  });

  @override
  List<Object> get props => [
        emailError ?? '',
        passwordError ?? '',
      ];
}

