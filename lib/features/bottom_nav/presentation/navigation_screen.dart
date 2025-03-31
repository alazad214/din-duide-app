import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/app_assets/assets_icons.dart';
import '../../../constants/app_colors.dart';
import '../../settings/presentation/settings_screen.dart';
import '../../alarm/presentation/alarm_screen.dart';
import '../../home/presentation/home_screen.dart';
import '../../salat/presentation/salat_screen.dart';

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

  List pages = [
    const HomeScreen(),
    const SalatScreen(),
    const AlarmScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: pages[selectedIndex],

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
                      Images[index],
                      width: 26.w,
                      height: 26.h,
                      color:
                          selectedIndex == index
                              ? AppColors.primaryColor
                              : Colors.black87,
                    ),
                    const SizedBox(height: 5),

                    Text(
                      labels[index],
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
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

List Images = [
  AssetsIcons.home,
  AssetsIcons.salat,
  AssetsIcons.alarm,
  AssetsIcons.profile,
];

List<String> labels = ["Home", "Salat", "Alarm", "Profile"];
