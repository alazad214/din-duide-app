import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/common/utils/assets_image.dart';
import '../../core/helpers/check_login.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    checkUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Get.height / 1,
            width: Get.width / 1,
            child: Image.asset(AssetsImage.splashBG, fit: BoxFit.cover),
          ),
          Center(child: Image.asset(AssetsImage.logoPng, height: 150.h,)),
        ],
      ),
    );
  }
}
