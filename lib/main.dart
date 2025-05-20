import 'package:din_guide_app/features/splash/welcome_screen.dart';
import 'package:din_guide_app/helpers/app_rotation.dart';
import 'package:din_guide_app/helpers/app_version.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'helpers/di.dart';
import 'helpers/helper_methods.dart';
import 'helpers/network_checker/internet_controller.dart';
import 'helpers/provider_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  diSetup();
  rotation();
  await GetStorage.init();
  await AppVersionInfo().load();
  Get.put(InternetController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    setInitValue();
    return MultiProvider(
      providers: providerLists,
      child: ProviderScope(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return const UtillScreenMobile();
          },
        ),
      ),
    );
  }
}

class UtillScreenMobile extends StatelessWidget {
  const UtillScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return ToastificationWrapper(
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            builder: EasyLoading.init(),
            home: const WelcomeScreen(),
          ),
        );
      },
    );
  }
}
