import 'package:din_guide_app/core/common/utils/assets_image.dart';
import 'package:din_guide_app/features/home/widgets/salat_popup.dart';
import 'package:din_guide_app/features/salat/data/api_service.dart';
import 'package:din_guide_app/features/salat/model/prayers_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/common/styles/app_colors.dart';
import '../../../core/networks/di/appdata_di.dart';

class PrayersTime extends StatefulWidget {
  const PrayersTime({super.key});

  @override
  State<PrayersTime> createState() => _PrayersTimeState();
}

class _PrayersTimeState extends State<PrayersTime> {
  late final Future<PrayersModel> _prayersModelFuture;

  String selectedDate = '';
  String selectedCity = appData.read('selectedLocation');

  @override
  void initState() {
    super.initState();
    _prayersModelFuture = PrayerService().fetchPrayerTimes(
      selectedCity,
      selectedDate,
    );
  }

  final List<String> prayerNames = const [
    'ফজর',
    'যোহর',
    'আসর',
    'মাগরিব',
    'এশা',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: FutureBuilder(
        future: _prayersModelFuture,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Row(
                  children: List.generate(5, (index) => shimmerItem()),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong!"));
          }

          final prayerData = snapshot.data;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 10,
              children: [
                buildHomeSalatWidget(
                  context,
                  image: AssetsImage.fajr,
                  prayerName: 'ফজর',
                  prayerTime: prayerData!.items!.first.fajr ?? 'N/A',
                ),
                buildHomeSalatWidget(
                  context,
                  image: AssetsImage.jahr,
                  prayerName: 'যোহর',
                  prayerTime: prayerData.items!.first.dhuhr ?? 'N/A',
                ),
                buildHomeSalatWidget(
                  context,
                  image: AssetsImage.asr,
                  prayerName: 'আসর',
                  prayerTime: prayerData.items!.first.asr ?? 'N/A',
                ),
                buildHomeSalatWidget(
                  context,
                  image: AssetsImage.magrib,
                  prayerName: 'মাগরিব',
                  prayerTime: prayerData.items!.first.maghrib ?? 'N/A',
                ),
                buildHomeSalatWidget(
                  context,
                  image: AssetsImage.isha,
                  prayerName: 'এশা',
                  prayerTime: prayerData.items!.first.isha ?? 'N/A',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget shimmerItem() {
    return Container(
      width: 90,
      height: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  GestureDetector buildHomeSalatWidget(
    BuildContext context, {
    image,
    prayerName,
    prayerTime,
  }) {
    return GestureDetector(
      onTap: () {
        showSalatPopup(context, prayerName, image, prayerTime);
      },
      child: Container(
        width: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.primaryColor.withAlpha((0.2 * 255).toInt()),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha((0.2 * 255).toInt()),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(image, fit: BoxFit.contain),
            ),
            const SizedBox(height: 8),
            Text(
              prayerName,
              style: GoogleFonts.notoSansBengali(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
