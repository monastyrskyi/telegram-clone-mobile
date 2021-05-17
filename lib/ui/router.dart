import 'package:flutter/material.dart';
import 'package:telegram_clone_mobile/ui/screens/auth/auth.dart';
import 'package:telegram_clone_mobile/util/slide_left_with_fade_route.dart';

abstract class AppRoutes {
  static const String Home = '/';
  static const String Auth = 'auth';
}

class RootRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.Auth:
        return SlideLeftWithFadeRoute(
          builder: (context) => AuthScreen(),
        );
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Telegram'),
            ),
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
