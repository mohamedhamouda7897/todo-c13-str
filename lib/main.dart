import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c13_str/firebase/firebase_manager.dart';
import 'package:todo_c13_str/firebase_options.dart';
import 'package:todo_c13_str/screens/add_event.dart';
import 'package:todo_c13_str/screens/home/home_screen.dart';
import 'package:todo_c13_str/screens/introduction_screen.dart';
import 'package:todo_c13_str/providers/my_provider.dart';
import 'package:todo_c13_str/screens/login_screen.dart';
import 'package:todo_c13_str/screens/register_screen.dart';
import 'package:todo_c13_str/theme/base_theme.dart';
import 'package:todo_c13_str/theme/dark_theme.dart';
import 'package:todo_c13_str/theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.enableNetwork();


  runApp(ChangeNotifierProvider(
    create: (context) => MyProvider(),
    child: EasyLocalization(
        supportedLocales: [
          const Locale('en'),
          const Locale('ar'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// flutterfire configure --project=todo-c13-str --android-app-id=com.example.todo_c13_str
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    BaseTheme light = LightTheme();
    BaseTheme dark = DarkTheme();
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: light.themeData,
      darkTheme: dark.themeData,
      themeMode: pro.themeMode,
      debugShowCheckedModeBanner: false,
      initialRoute: IntroductionScreen.routeName,
      routes: {
        IntroductionScreen.routeName: (context) => const IntroductionScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        AddEventScreen.routeName: (context) => AddEventScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
