import 'package:get/get.dart';
import '../constants/app_constants.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/onboarding/presentation/onboarding_screen1.dart';
import '../networks/dio/dio.dart';
import 'di.dart';

void checkUserLogin() async {
  await Future.delayed(const Duration(seconds: 2), () {
    if (appData.read(kKayAccessToken) != null) {
      Get.offAll(() =>  const HomeScreen());
      String token = appData.read(kKayAccessToken);
      DioSingleton.instance.update(token);
    } else {
      Get.offAll(() => const OnboardingScreen1());
    }
  });
}
