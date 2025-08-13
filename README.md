# 📱 Findoc Flutter App + Login with BLoC Pattern

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-blue?logo=dart)
![Platform](https://img.shields.io/badge/Platform-Android-green?logo=android)
![License](https://img.shields.io/badge/License-MIT-orange)

A modern Flutter application demonstrating a login screen with email/password validation using the **BLoC (Business Logic Component)** pattern, regex validation, and navigation to a home screen.

## 🚀 Features

- **BLoC Pattern Implementation**: Clean separation of business logic from UI
- **Email Validation**: Regex-based email validation with real-time feedback
- **Password Validation**: Strong password requirements with regex validation
- **Modern UI**: Beautiful gradient design with Material Design 3
- **Form Validation**: Real-time validation with error messages
- **Navigation**: Seamless navigation between login and home screens
- **Loading States**: Proper loading indicators during authentication
- **Error Handling**: Comprehensive error handling and user feedback

---

## 🔑 Password Requirements

The password must meet the following criteria:
- At least **8 characters long**
- Contains at least **1 uppercase letter**
- Contains at least **1 lowercase letter**
- Contains at least **1 number**
- Contains at least **1 special character** (`@$!%*?&`)

---

## 📧 Email Validation

Uses both:
- **email_validator** package
- Custom regex:  
^[a-zA-Z0-9.]+@[a-zA-Z0-9]+.[a-zA-Z]+

---

## 🧪 Demo Credentials

For quick testing:
- **Email**: `user@example.com`
- **Password**: `Test@123`

---

## 📂 Project Structure

lib/
├── main.dart # App entry point with BLoC providers
├── blocs/
│ └── auth/
│ ├── auth_bloc.dart # Main authentication BLoC
│ ├── auth_event.dart # Authentication events
│ └── auth_state.dart # Authentication states
├── screens/
│ ├── login_screen.dart # Login screen with validation
│ └── home_screen.dart # Home screen after successful login
└── utils/
└── validators.dart # Email and password validation utilities

---

## 📦 Dependencies

- `flutter_bloc`: ^8.1.3 - BLoC pattern implementation
- `equatable`: ^2.0.5 - Value equality for BLoC states
- `email_validator`: ^2.1.17 - Email validation

---

## ⚙️ Setup Instructions

1. **Clone the repository**:
   ```bash
   git clone https://github.com/KrVikashGupta/Findoc_Flutter_App.git
   cd Findoc_Flutter_App

---

### 2️⃣ Install dependencies
flutter pub get

---

### 3️⃣ Run in application
flutter run

---

📱 Usage
1. Launch the app - you'll see the login screen.

2. Enter credentials - use the demo credentials or your own.

3. Real-time validation will show errors if input is invalid.

4. Tap Sign In to proceed.

5. Navigate to Home Screen on success.

6. Use Logout to return to login.

---

🎯 Benefits of BLoC Pattern
Separation of concerns (UI ↔ business logic)

Easier testing and debugging

Reusable components

Predictable state transitions

Reactive UI updates

---

🎨 Customization
Colors → Modify gradient colors in login_screen.dart

Validation Rules → Update regex in validators.dart

UI Components → Update design in screens/

Auth Logic → Replace mock logic in auth_bloc.dart

🤝 Contributing
Pull requests are welcome!
You can help by:

Reporting bugs

Suggesting features

Improving documentation

---




