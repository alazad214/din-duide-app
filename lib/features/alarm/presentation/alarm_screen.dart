import 'package:din_guide_app/constants/app_assets/assets_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_assets/assets_image.dart';
import '../../../constants/app_colors.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  int selectedItem = 0;
  List weekList = ['Sat', 'Sun', 'Mon', 'Tues', 'Wed', 'Thur', 'Fri'];
  List<Map> prayerTime = [
    {'name': 'Imsaak', 'time': '5:38'},
    {'name': 'Dawn', 'time': '5:48 '},
    {'name': 'Sunrise', 'time': '7:27 '},
    {'name': 'Noon', 'time': '11:46'},
    {'name': 'Sunset', 'time': '4:05'},
    {'name': 'maghrib', 'time': '4:20'},
    {'name': 'Midnight', 'time': '10:56'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height / 8,
              width: Get.width / 1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsImage.bg2),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: const SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Alarm Time Set',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AssetsImage.alarm, height: 200),
                  const SizedBox(height: 40),
                  Text(
                    prayerTime[selectedItem]['time'],
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "${DateTime.now().day}, ${DateTime.now().month}, ${DateTime.now().year}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  const SizedBox(height: 40),

                  //Time Card-->
                  ListView.builder(
                    itemCount: prayerTime.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      final data = prayerTime[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedItem = index;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          height: 76,
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            color:
                                selectedItem == index
                                    ? AppColors.primaryColor
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 10,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      spacing: 16,
                                      children: [
                                        Container(
                                          width: 58,
                                          height: 58,
                                          padding: const EdgeInsets.all(9),
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: Image.asset(AssetsIcons.sun),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data['name'],
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color:
                                                    selectedItem == index
                                                        ? Colors.white
                                                        : Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              "Alarm Set",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color:
                                                    selectedItem == index
                                                        ? Colors.white
                                                        : Colors.black54,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      data['time'],
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color:
                                            selectedItem == index
                                                ? Colors.white
                                                : Colors.black87,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Switch(
                                      value: data['isSwitchValue'] ?? false,
                                      activeColor:
                                          selectedItem == index
                                              ? Colors.white
                                              : AppColors.primaryColor,

                                      onChanged: (value) {
                                        setState(() {
                                          data['isSwitchValue'] = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
