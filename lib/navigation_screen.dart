import 'package:din_guide_app/common_widgets/common_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants/app_assets/assets_icons.dart';
import 'constants/app_colors.dart';
import 'features/settings/presentation/settings_screen.dart';
import 'features/salat/presentation/salat_screen.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/features/presentation/features_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int selectedIndex = 0;

  void onItemTaped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void switchToFeatures() {
    setState(() {
      selectedIndex = 1;
    });
  }

  void switchTosalat() {
    setState(() {
      selectedIndex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          await CommonPopup.popup(
            context,
            title: 'Exit App!',
            subtitle: 'Are you sure you want to exit the app?',
            ontap: () {
              SystemNavigator.pop();
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,

        body:
            selectedIndex == 0
                ? HomeScreen(
                  seeMoreFeatures: switchToFeatures,
                  salatFeatures: switchTosalat,
                )
                : selectedIndex == 1
                ? const FeaturesScreen()
                : selectedIndex == 2
                ? const SalatScreen()
                : const SettingsScreen(),

        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: const BoxDecoration(color: AppColors.cWhite),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(4, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      images[index],
                      width: 26.w,
                      height: 26.h,
                      color:
                          selectedIndex == index
                              ? AppColors.primaryColor
                              : Colors.black,
                    ),
                    const SizedBox(height: 5),

                    Text(
                      labels[index],
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color:
                            selectedIndex == index
                                ? AppColors.primaryColor
                                : Colors.black87,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

List images = [
  AssetsIcons.home,
  AssetsIcons.category,
  AssetsIcons.salat,
  AssetsIcons.settings,
];

List<String> labels = ["Home", "Features", "Salat", "Settings"];
