import 'package:din_guide_app/constants/app_assets/assets_image.dart';
import 'package:din_guide_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

class HomeHeader extends StatelessWidget {
  final VoidCallback drawerOntap;
  const HomeHeader({super.key, required this.drawerOntap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 6,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 3,
                      ),
                    ),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage(AssetsImage.islamicBot),
                          fit: BoxFit.cover,
                        ),
                        shape: const OvalBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: drawerOntap,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white24,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.menu, color: AppColors.cWhite),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        //GREETING MESSAGE-->
        const Text(
          'আস-সালামু আলাইকুম',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),

        //HIJRI DATE-->
        StreamBuilder(
          stream: Stream.periodic(const Duration(seconds: 1)),
          builder: (context, snapshot) {
            final hijriDate = HijriCalendar.now();
            return Text(
              '${hijriDate.hDay}, ${hijriDate.getLongMonthName()} ,${hijriDate.hYear}',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            );
          },
        ),

        //CURRENT TIME-->
        StreamBuilder(
          stream: Stream.periodic(const Duration(seconds: 1)),
          builder: (context, snapshot) {
            return Text(
              TimeOfDay.now().format(context),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            );
          },
        ),
      ],
    );
  }
}
