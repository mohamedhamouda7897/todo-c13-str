import 'package:flutter/material.dart';

class IntroductionScreen extends StatelessWidget {
  static const String routeName = "IntroScreen";

  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/app_logo.png"),
      ),
    );
  }
}
