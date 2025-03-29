import 'package:din_guide_app/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:provider/provider.dart';
import 'helpers/all_routes.dart';
import 'helpers/di.dart';
import 'helpers/helper_methods.dart';
import 'helpers/navigation_service.dart';
import 'helpers/provider_list.dart';
import 'networks/dio/dio.dart';
import 'networks/internet_checker/internet_checker_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  diSetup();
  DioSingleton.instance.create();
  Get.put(InternetController(), permanent: true);
  runApp(MultiProvider(providers: providerLists, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    rotation();
    setInitValue();
    return AnimateIfVisibleWrapper(
      showItemInterval: const Duration(milliseconds: 150),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return const UtillScreenMobile();
        },
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
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          builder: EasyLoading.init(),
          navigatorKey: NavigationService.navigatorKey,
          onGenerateRoute: RouteGenerator.generateRoute,
          home: WelcomeScreen(),
        );
      },
    );
  }
}
