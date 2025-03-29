import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/app_assets/assets_image.dart';
import 'constants/text_font_style.dart';
import 'helpers/checkLogin.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
                child: Column(
                  children: [
                    Text('Logo', style: TextFontStyle.headline40w700cWhite),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
