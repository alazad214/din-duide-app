import 'package:flutter/material.dart';
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
            child: Image.asset(AssetsImage.bg, fit: BoxFit.cover),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(children: [Image.asset(AssetsImage.logoPng)]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
