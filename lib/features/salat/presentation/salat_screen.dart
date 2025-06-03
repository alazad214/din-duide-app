import 'dart:developer';
import 'package:din_guide_app/core/common/widgets/auth_appbar.dart';
import 'package:din_guide_app/core/di/appdata_di.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/common/utils/assets_icons.dart';
import '../../../core/common/styles/app_colors.dart';
import '../data/api_service.dart';
import '../data/citys.dart';
import '../model/prayers_model.dart';
import '../widgets/shimmer_loading.dart';

class SalatScreen extends StatefulWidget {
  const SalatScreen({super.key});

  @override
  State<SalatScreen> createState() => _SalatScreenState();
}

class _SalatScreenState extends State<SalatScreen> {
  int selectedItem = 0;
  int selectedItem2 = 0;
  String selectedDate = '';
  String selectedCity = appData.read('selectedLocation');
  late Future<PrayersModel> _prayersModelFuture;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _prayersModelFuture = PrayerService().fetchPrayerTimes(
      selectedCity,
      selectedDate,
    );
  }

  List<String> getNext7Days() {
    List<String> next7Days = [];
    DateTime currentDate = DateTime.now();

    for (int i = 0; i < 7; i++) {
      next7Days.add(
        DateFormat('dd-MM-yyyy').format(currentDate.add(Duration(days: i))),
      );
    }
    return next7Days;
  }

  String getShortWeekdayName(String dateString) {
    DateFormat inputFormat = DateFormat('dd-MM-yyyy');
    DateFormat outputFormat = DateFormat('yyyy-MM-dd');

    DateTime date = inputFormat.parse(dateString);
    String formattedDate = outputFormat.format(date);

    DateTime validDate = DateTime.parse(formattedDate);
    return DateFormat('EEE').format(validDate);
  }

  @override
  Widget build(BuildContext context) {
    List<String> last7Days = getNext7Days();
    return Scaffold(
      key: scaffoldKey,

      appBar: const CustomAppbar(
        title: 'নামাজের সময়সূচি',
        leadingVisible: false,
      ),
      body: FutureBuilder(
        future: _prayersModelFuture,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingShimmer();
          } else if (snapshot.hasError) {
            log("Message : ${snapshot.error}");
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final prayerData = snapshot.data;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "পরবর্তী ৭ দিনের নামাজের সময়",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                buildSevenDays(last7Days),

                const SizedBox(height: 20),
                buildPrayersDropdown(),
                const SizedBox(height: 10),

                Column(
                  children: [
                    buildPrayersTime(
                      name: "ফজর",
                      time: prayerData!.items!.first.fajr ?? 'N/A',
                    ),
                    buildPrayersTime(
                      name: "যোহর",
                      time: prayerData.items!.first.dhuhr ?? 'N/A',
                    ),
                    buildPrayersTime(
                      name: "আসর",
                      time: prayerData.items!.first.asr ?? 'N/A',
                    ),
                    buildPrayersTime(
                      name: "মাগরিব",
                      time: prayerData.items!.first.maghrib ?? 'N/A',
                    ),
                    buildPrayersTime(
                      name: "এশা",
                      time: prayerData.items!.first.isha ?? 'N/A',
                    ),
                    buildPrayersTime(
                      name: "সূর্যোদয়",
                      time: prayerData.items!.first.shurooq ?? 'N/A',
                    ),
                  ],
                ),

                const SizedBox(height: 50),
              ],
            ),
          );
        },
      ),
   
   
   
    );
  }

  Row buildPrayersDropdown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "শহর নির্বাচন",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[200],
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedCity,
              icon: const Icon(Icons.keyboard_arrow_down),
              style: const TextStyle(color: AppColors.c000000, fontSize: 16),
              items:
                  citys.map((String city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city[0].toUpperCase() + city.substring(1)),
                    );
                  }).toList(),
              onChanged: (String? value) {
                setState(() {
                  appData.write('selectedLocation', value);
                  selectedCity = value ?? 'dhaka';
                  _prayersModelFuture = PrayerService().fetchPrayerTimes(
                    selectedCity,
                    selectedDate,
                  );
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  SizedBox buildSevenDays(List<String> last7Days) {
    return SizedBox(
      height: 90,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ListView.builder(
          itemCount: last7Days.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            String date = last7Days[index];

            return Padding(
              padding: const EdgeInsets.only(right: 14),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedItem2 = index;
                    selectedDate = date;
                    _prayersModelFuture = PrayerService().fetchPrayerTimes(
                      selectedCity,
                      selectedDate,
                    );
                  });
                  log("Selected Date: $selectedDate");
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 8,
                    right: 8,
                    bottom: 12,
                  ),
                  decoration: BoxDecoration(
                    color:
                        selectedItem2 == index
                            ? AppColors.primaryColor
                            : const Color(0x19187488),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 40,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 40,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    date.split('-').first,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Color(0xFF222222),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              getShortWeekdayName(date),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color:
                                    selectedItem2 == index
                                        ? AppColors.cWhite
                                        : AppColors.c000000,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Container buildPrayersTime({required name, required time}) {
    return Container(
      width: double.infinity,
      height: 76,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha((0.3 * 255).toInt()),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],

        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 16,
                  children: [
                    Container(
                      width: 58,
                      height: 58,
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        color: AppColors.cWhite,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        AssetsIcons.sun,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name ?? 'N/A',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,

                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  "$time",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,

                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
