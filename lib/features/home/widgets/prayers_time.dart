import 'package:din_guide_app/features/home/widgets/salat_popup.dart'
    show showSalatPopup;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Optional: for better font

import '../../../constants/app_assets/assets_image.dart' show AssetsImage;
import '../../../constants/app_colors.dart';

class PrayersTime extends StatefulWidget {
  const PrayersTime({super.key});

  @override
  State<PrayersTime> createState() => _PrayersTimeState();
}

class _PrayersTimeState extends State<PrayersTime> {
  final List<String> prayerIcons = [
    AssetsImage.fajr,
    AssetsImage.jahr,
    AssetsImage.asr,
    AssetsImage.magrib,
    AssetsImage.isha,
  ];

  final List<String> prayerNames = ['ফজর', 'যোহর', 'আসর', 'মাগরিব', 'এশা'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: prayerIcons.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showSalatPopup(
                context,
                prayerNames[index],
                prayerIcons[index],
                'content',
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              width: 100,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primaryColor, Color(0xFF00f2fe)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.6),
                          blurRadius: 6,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(prayerIcons[index], fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    prayerNames[index],
                    style: GoogleFonts.notoSansBengali(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
