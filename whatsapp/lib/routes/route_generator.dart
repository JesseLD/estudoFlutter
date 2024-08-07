import 'package:flutter/material.dart';
import 'package:whatsapp/screens/home_screen.dart';
import 'package:whatsapp/screens/login_screen.dart';
import 'package:whatsapp/screens/welcome_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case "/home":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case "/welcome_screen":
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case "/login_screen":
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}

