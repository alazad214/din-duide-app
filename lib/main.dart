import 'package:din_guide_app/core/routes/app_pages.dart';
import 'package:din_guide_app/core/routes/app_routes.dart';
import 'package:din_guide_app/core/helpers/app_rotation.dart';
import 'package:din_guide_app/core/helpers/app_version.dart';
import 'package:din_guide_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'core/networks/di/appdata_di.dart';
import 'core/helpers/helper_methods.dart';
import 'core/helpers/network_checker/internet_controller.dart';
import 'core/helpers/provider_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  diSetup();
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
    rotation();
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
            initialRoute: AppRoutes.loadingScreen,
            getPages: AppPages.routes,
          ),
        );
      },
    );
  }
}
