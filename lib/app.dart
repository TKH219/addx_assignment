import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/now_playing/screens/now_playing_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: NowPlayingScreen(),
    );
  }
}
