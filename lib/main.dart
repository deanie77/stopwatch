import 'package:flutter/material.dart';
import 'package:stopwatch/login_screen.dart';
import 'package:stopwatch/stopwatch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const LoginScreen(),
        LoginScreen.route: (context) => const LoginScreen(),
        StopWatch.route: (context) => const StopWatch(email: '', name: '',),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
