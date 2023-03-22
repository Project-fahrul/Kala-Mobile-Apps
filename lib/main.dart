import 'package:customer_retention/auth/change_password.dart';
import 'package:customer_retention/auth/confirm_token.dart';
import 'package:customer_retention/auth/forgot_password.dart';
import 'package:customer_retention/auth/login.dart';
import 'package:customer_retention/auth/register.dart';
import 'package:customer_retention/splash_screen.dart';
import 'package:customer_retention/template.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const KallaApp());
}

class KallaApp extends StatelessWidget {
  const KallaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Customer Retention",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF0E7F49)),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Color(0xFF0E7F49)),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/main":
            return MaterialPageRoute(builder: (_) => const TemplateApp());
          case "/login":
            return MaterialPageRoute(builder: (_) => const LoginPage());
          case "/register":
            return MaterialPageRoute(builder: (_) => const RegisterPage());
          case "/forgot":
            return MaterialPageRoute(
                builder: (_) => const ForgotPasswordPage());
          case "/change_password":
            return MaterialPageRoute(builder: (_) => const ChangePassword());
          case "/confirm_token":
            return MaterialPageRoute(builder: (_) => const ConfirmToken());
          default:
            return MaterialPageRoute(builder: (_) => const SplashScreen());
        }
      },
      home: const KallaAppTheme(),
    );
  }
}

class KallaAppTheme extends StatefulWidget {
  const KallaAppTheme({super.key});

  @override
  State<KallaAppTheme> createState() => _KallaAppThemeState();
}

class _KallaAppThemeState extends State<KallaAppTheme> {
  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
