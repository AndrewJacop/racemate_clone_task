import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:racemate_clone_task/constants/themes.dart';
import 'package:racemate_clone_task/utils/bindings.dart';
import 'package:racemate_clone_task/views/navigation_menu.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: RaceMateThemes.theme,
      initialBinding: RaceMateBinding(),
      initialRoute: '/nav',
      getPages: [
        GetPage(
          name: '/nav',
          page: () => const NavigationMenu(),
        ),
      ],
    );
  }
}
