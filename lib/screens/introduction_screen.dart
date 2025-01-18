import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_c13_str/main.dart';
import 'package:todo_c13_str/providers/my_provider.dart';
import 'package:todo_c13_str/screens/home/home_screen.dart';
import 'package:todo_c13_str/screens/login_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';

class IntroductionScreen extends StatelessWidget {
  static const String routeName = "IntroScreen";

  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/app_logo.png"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/intro_header.png",
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 28,
            ),
            Text(
              context.tr("introduction_title"),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 28,
            ),
            Text(
              "introduction_desc".tr(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "language".tr(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                ToggleSwitch(
                  minWidth: 73.0,
                  minHeight: 30.0,
                  initialLabelIndex: context.locale.toString() == "en" ? 0 : 1,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  icons: [
                    FontAwesomeIcons.flagUsa,
                    MdiIcons.abjadArabic,
                  ],
                  iconSize: 30.0,
                  activeBgColors: [
                    [
                      Theme.of(context).primaryColor,
                      Theme.of(context).scaffoldBackgroundColor
                    ],
                    [Colors.yellow, Colors.orange]
                  ],
                  animate: true,
                  curve: Curves.bounceInOut,
                  onToggle: (index) {
                    if (index == 0) {
                      context.setLocale(Locale("en"));
                    } else {
                      context.setLocale(Locale("ar"));
                    }
                    print('switched to: $index');
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "theme".tr(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                ToggleSwitch(
                  minWidth: 73.0,
                  minHeight: 30.0,
                  initialLabelIndex:
                      provider.themeMode == ThemeMode.light ? 0 : 1,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  icons: [
                    FontAwesomeIcons.lightbulb,
                    FontAwesomeIcons.moon,
                  ],
                  iconSize: 30.0,
                  activeBgColors: [
                    [
                      Theme.of(context).primaryColor,
                      Theme.of(context).scaffoldBackgroundColor
                    ],
                    [Colors.yellow, Colors.orange]
                  ],
                  animate: true,
                  curve: Curves.bounceInOut,
                  onToggle: (index) {
                    provider.changeTheme(index!, context.locale.toString());
                    print('switched to: $index ${context.locale.toString()}');
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              },
              child: Text(
                "lets_start".tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
