
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_assets/assets_icons.dart';
import '../../../constants/app_assets/assets_image.dart';
import '../../../constants/app_colors.dart';

class SalatScreen extends StatefulWidget {
  const SalatScreen({super.key});

  @override
  State<SalatScreen> createState() => _SalatScreenState();
}

class _SalatScreenState extends State<SalatScreen> {
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
                    'Prayer Date & Time',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Time button-->
                  SizedBox(
                    height: 90,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ListView.builder(
                        itemCount: weekList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 14),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedItem = index;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  left: 8,
                                  right: 8,
                                  bottom: 12,
                                ),
                                decoration: ShapeDecoration(
                                  color:
                                      selectedItem == index
                                          ? AppColors.primaryColor
                                          : const Color(0x19187488),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60),
                                  ),
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
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            child: const Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '11',
                                                  style: TextStyle(
                                                    color: Color(
                                                      0xFF222222,
                                                    ),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            weekList[index],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color:
                                                  selectedItem == index
                                                      ? AppColors.cWhite
                                                      : AppColors.c000000,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
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
                  ),

               const   SizedBox(height: 40),

                  //Time Card-->
                  ListView.builder(
                    itemCount: prayerTime.length,
                    shrinkWrap: true,
                    padding:const EdgeInsets.all(0),
                    physics:const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      final data = prayerTime[index];
                      return Container(
                        width: double.infinity,
                        height: 76,
                        margin:const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,

                              children: [
                                Container(
                                  width: 58,
                                  height: 58,
                                  padding: const EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.asset(AssetsIcons.sun),
                                ),

                                Expanded(
                                  child: Text(
                                    data['name'],
                                    textAlign: TextAlign.center,
                                    style:const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    data['time'],
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style:const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                const  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
