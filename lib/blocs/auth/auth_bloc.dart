import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../utils/validators.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    // Validate email and password
    final emailError = Validators.validateEmail(event.email);
    final passwordError = Validators.validatePassword(event.password);

    if (emailError != null || passwordError != null) {
      emit(AuthValidationError(
        emailError: emailError,
        passwordError: passwordError,
      ));
      return;
    }

    emit(AuthLoading());

    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 2));

      // For demo purposes, accept any valid email/password combination
      // In a real app, you would make an API call here
      if (Validators.isValidEmail(event.email) && 
          Validators.isValidPassword(event.password)) {
        emit(AuthSuccess(event.email));
      } else {
        emit(const AuthFailure('Invalid credentials'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthInitial());
  }

  void _onEmailChanged(
    EmailChanged event,
    Emitter<AuthState> emit,
  ) {
    // Clear validation errors when user starts typing
    if (state is AuthValidationError) {
      final currentState = state as AuthValidationError;
      if (currentState.emailError != null) {
        emit(AuthValidationError(
          emailError: null,
          passwordError: currentState.passwordError,
        ));
      }
    }
  }

  void _onPasswordChanged(
    PasswordChanged event,
    Emitter<AuthState> emit,
  ) {
    // Clear validation errors when user starts typing
    if (state is AuthValidationError) {
      final currentState = state as AuthValidationError;
      if (currentState.passwordError != null) {
        emit(AuthValidationError(
          emailError: currentState.emailError,
          passwordError: null,
        ));
      }
    }
  }
}

