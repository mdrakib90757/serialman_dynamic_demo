import 'package:flutter/material.dart';
import 'package:serialman/feature/auth_feature/view/login_screen.dart';
import 'package:serialman/feature/splash_feature/view/spalsh_screen.dart';

import 'core/shared_widget/custom_background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SerialMan Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const OnboardingScreen(),
    );
  }
}
