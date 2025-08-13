import 'package:email_validator/email_validator.dart';

class Validators {
  // Email regex pattern
  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
  );

  // Password regex pattern - at least 8 characters, 1 uppercase, 1 lowercase, 1 number, 1 special character
  static final RegExp _passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    
    if (!EmailValidator.validate(email)) {
      return 'Please enter a valid email address';
    }
    
    if (!_emailRegex.hasMatch(email)) {
      return 'Please enter a valid email format';
    }
    
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    
    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    
    if (!_passwordRegex.hasMatch(password)) {
      return 'Password must contain at least:\n• 1 uppercase letter\n• 1 lowercase letter\n• 1 number\n• 1 special character (@\$!%*?&)';
    }
    
    return null;
  }

  static bool isValidEmail(String email) {
    return validateEmail(email) == null;
  }

  static bool isValidPassword(String password) {
    return validatePassword(password) == null;
  }
}

