import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'dart:ui';

import 'package:customer_retention/api/evidance_api.dart';
import 'package:customer_retention/auth/change_password.dart';
import 'package:customer_retention/auth/confirm_token.dart';
import 'package:customer_retention/auth/forgot_password.dart';
import 'package:customer_retention/auth/login.dart';
import 'package:customer_retention/auth/register.dart';
import 'package:customer_retention/model/dao/template_model.dart';
import 'package:customer_retention/model/evidance_model.dart';
import 'package:customer_retention/splash_screen.dart';
import 'package:customer_retention/template.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'local_notification.dart' as notify;
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

const String isolateName = 'isolate';

// /// A port used to communicate from a background isolate to the UI isolate.
final ReceivePort port = ReceivePort();

DateTime getTime() {
  final d = DateTime.now();
  int h = 11, day = 0;
  if (d.hour >= 0 && d.hour < 8) {
    h = 8;
  } else if (d.hour >= 8 && d.hour < 11) {
    h = 11;
  } else if (d.hour >= 11 && d.hour < 15) {
    h = 15;
  } else {
    h = 8;
    day = 1;
  }

  var r = DateTime(d.year, d.month, d.day, h, 10, 0);
  if (day > 0) r = r.add(Duration(days: day));
  print(r);
  return r;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  IsolateNameServer.registerPortWithName(
    port.sendPort,
    isolateName,
  );

  notify.initNotifications();

  AndroidAlarmManager.initialize();
  HttpOverrides.global = new MyHttpOverrides();
  notify.initNotifications();
  runApp(const KallaApp());

  await AndroidAlarmManager.oneShotAt(getTime(), 0, printHello);
}

@pragma('vm:entry-point')
void printHello() async {
  final DateTime now = DateTime.now();
  var rand = Random();
  var hash = rand.nextInt(100);
  print("alarm");
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = await prefs.getString("kallaToken");
    final evidance = await EvidanceApi.getEvidance(token!);
    List<EvidanceModel> data =
        evidance.evidances.where((element) => element.isUploaded == 0).toList();
    await AndroidAlarmManager.oneShotAt(getTime(), 0, printHello);
    notify.singleNotification(now, data, hash);
  } catch (e) {
    print(e);
  }
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
            return MaterialPageRoute(
                builder: (_) =>
                    TemplateApp(settings.arguments as TemplateModel));
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
