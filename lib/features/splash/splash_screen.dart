import 'package:addx_assignment/components/loading_circle.dart';
import 'package:addx_assignment/features/now_playing/screens/now_playing_screen.dart';
import 'package:addx_assignment/injection.dart';
import 'package:addx_assignment/utils/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await secureStorage.write(
        key: SecureStorageConstant.ACCESS_TOKEN,
        value:
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YjI4MjBmOTZmZWMxOGEyZmZmNjI3ZWNkYmIzM2Q3MiIsInN1YiI6IjY0ZTBkMTA3NWFiODFhMDBlMjViZmI4YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6m2-jcYdv23zvVALKF7gBOYVcHyWQUQtsWl_C4a5JQY',
      );

      Get.off(NowPlayingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoadingCircle();
  }

}