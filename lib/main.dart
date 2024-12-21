import 'package:flutter/material.dart';
import 'package:todo_c13_str/introduction_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: IntroductionScreen.routeName,
      routes: {IntroductionScreen.routeName: (context) => IntroductionScreen()},
    );
  }
}
