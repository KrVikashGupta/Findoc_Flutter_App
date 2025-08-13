import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  // Email pattern
  static final RegExp _emailRegex = RegExp(
    r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
  );

  // Password: Min 8 chars, uppercase, lowercase, number, special char
  static final RegExp _passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    final email = event.email.trim();
    emit(state.copyWith(
      email: email,
      emailError: _validateEmail(email),
      isSuccess: false,
      generalError: null,
    ));
  }

  void _onPasswordChanged(LoginPasswordChanged event, Emitter<LoginState> emit) {
    final password = event.password;
    emit(state.copyWith(
      password: password,
      passwordError: _validatePassword(password),
      isSuccess: false,
      generalError: null,
    ));
  }

  Future<void> _onSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    final emailError = _validateEmail(state.email);
    final passwordError = _validatePassword(state.password);

    // If there’s any validation error, show it and return
    if (emailError != null || passwordError != null) {
      emit(state.copyWith(
        emailError: emailError,
        passwordError: passwordError,
        isSubmitting: false,
        isSuccess: false,
      ));
      return;
    }

    // Show loading
    emit(state.copyWith(isSubmitting: true, generalError: null));

    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 800));

    // Simulate successful login
    emit(state.copyWith(
      isSubmitting: false,
      isSuccess: true,
    ));
  }

  String? _validateEmail(String? email) {
    if (email == null || email.isEmpty) return 'Email is required';
    if (!_emailRegex.hasMatch(email)) return 'Enter a valid email address';
    return null;
  }

  String? _validatePassword(String? password) {
    if (password == null || password.isEmpty) return 'Password is required';
    if (!_passwordRegex.hasMatch(password)) {
      return 'Must have upper, lower, number & special char';
    }
    return null;
  }
}

