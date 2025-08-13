# 📱 Findoc Flutter App – Login with BLoC Pattern

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-blue?logo=dart)
![Platform](https://img.shields.io/badge/Platform-Android-green?logo=android)
![License](https://img.shields.io/badge/License-MIT-orange)

A modern **Flutter** application demonstrating a login screen with **email/password validation**, implemented using the **BLoC (Business Logic Component)** pattern. It features regex validation, real-time form feedback, and smooth navigation to a home screen.

---

## 🚀 Features

- **BLoC Pattern** → Clean separation of UI and business logic  
- **Email Validation** → Real-time regex-based validation  
- **Password Validation** → Strong password rules for security  
- **Modern UI** → Gradient background + Material Design 3  
- **Form Validation** → Error hints while typing  
- **Navigation** → Seamless switch between login & home  
- **Loading States** → Progress indicator on authentication  
- **Error Handling** → Clear feedback for invalid inputs  

---

## 🔑 Password Requirements

A valid password must contain:
- ✅ Minimum **8 characters**
- ✅ At least **1 uppercase letter**
- ✅ At least **1 lowercase letter**
- ✅ At least **1 number**
- ✅ At least **1 special character** (\`@$!%*?&\`)

---

## 📧 Email Validation

- Uses **\`email_validator\`** package  
- Also validates with custom regex:  
  \`\`\`
  ^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+
  \`\`\`

---

## 🧪 Demo Credentials

For quick testing:
\`\`\`
Email:    user@example.com
Password: Test@123
\`\`\`

---

<pre>
## 📂 Project Structure

```plaintext
lib/
├── main.dart                # App entry point with BLoC providers
├── blocs/
│   └── auth/
│       ├── auth_bloc.dart    # Main authentication BLoC
│       ├── auth_event.dart   # Authentication events
│       └── auth_state.dart   # Authentication states
├── screens/
│   ├── login_screen.dart     # Login screen with validation
│   └── home_screen.dart      # Home screen after successful login
└── utils/
    └── validators.dart       # Email and password validation utilities
</pre>

---

## 📦 Dependencies

- **\`flutter_bloc\`**: ^8.1.3 – State management using BLoC  
- **\`equatable\`**: ^2.0.5 – Value equality for BLoC states  
- **\`email_validator\`**: ^2.1.17 – Email validation  

---

## ⚙️ Setup Instructions

### 1️⃣ Clone the repository
\`\`\`bash
git clone https://github.com/KrVikashGupta/Findoc_Flutter_App.git
cd Findoc_Flutter_App
\`\`\`

### 2️⃣ Install dependencies
\`\`\`bash
flutter pub get
\`\`\`

### 3️⃣ Run the application
\`\`\`bash
flutter run
\`\`\`

---

## 📱 Usage

1. Open the app – you’ll see the **Login Screen**.  
2. Enter your email & password – errors show in real time if invalid.  
3. Tap **Sign In** to authenticate.  
4. On success, navigate to the **Home Screen**.  
5. Tap **Logout** to return to the login page.  

---

## 🎯 Benefits of BLoC Pattern

- 📦 Reusable code components  
- 🔍 Easier testing & debugging  
- 🧹 Cleaner separation of concerns  
- 🔄 Predictable state transitions  
- ⚡ Reactive UI updates  

---

## 🎨 Customization

- **Colors** → Edit gradients in \`login_screen.dart\`  
- **Validation Rules** → Modify regex in \`validators.dart\`  
- **UI Components** → Update design in \`screens/\`  
- **Auth Logic** → Replace mock auth in \`auth_bloc.dart\`  

---

## 🤝 Contributing

Pull requests are welcome!  
You can contribute by:
- Reporting bugs  
- Suggesting new features  
- Improving documentation  

---

## 📜 License

This project is licensed under the **MIT License**.  
See the [LICENSE](LICENSE) file for details.
" > README.md

# Stage the README.md file
git add README.md

# Commit with a message
git commit -m "Add polished README with BLoC pattern details"

# Push to your main branch
git push origin main

---

## 📫 Contact

**Vikash Kumar Gupta**  
📍 Bokaro Steel City, Jharkhand  
✉️ [vikashkumargupta907@gmail.com](mailto:vikashkumargupta907@gmail.com)  
🔗 [LinkedIn](https://linkedin.com/in/vikash1995) | [GitHub](https://github.com/KrVikashGupta)

---

⭐ If you find this project useful, please consider giving it a star to support the work!
