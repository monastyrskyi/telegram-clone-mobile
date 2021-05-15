import 'package:flutter/material.dart';
import 'package:telegram_clone_mobile/ui/router.dart';
import 'package:telegram_clone_mobile/ui/screens/auth/input_phone_screen.dart';
import 'package:telegram_clone_mobile/ui/themes/theme_manager.dart';

void main() => runApp(TelegramCloneApp());

class TelegramCloneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram',
      theme: ThemeManager.darkTheme,
      home: InputPhoneScreen(),
      onGenerateRoute: RootRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}