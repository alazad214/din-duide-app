import 'package:din_guide_app/features/bottom_nav/presentation/navigation_screen.dart';
import 'package:din_guide_app/core/networks/di/appdata_di.dart';
import 'package:get/get.dart';
import '../../features/onboarding/presentation/location_picker_screen.dart';

void checkUserLogin() async {
  await Future.delayed(const Duration(seconds: 2));

  final location = appData.read('selectedLocation');

  if (location != null && location.isNotEmpty) {
    Get.offAll(() => const NavigationScreen());
  } else {
    Get.offAll(() => const LocationPickerScreen());
  }
}
