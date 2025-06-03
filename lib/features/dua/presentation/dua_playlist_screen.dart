
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/common/utils/assets_icons.dart';
import '../../../core/common/utils/assets_image.dart';
import '../../../core/common/styles/app_colors.dart';
import 'dua_details_screen.dart' show DuaDetailsScreen;

class DuaPlaylistScreen extends StatefulWidget {
  const DuaPlaylistScreen({super.key});

  @override
  State<DuaPlaylistScreen> createState() => _DuaPlaylistScreenState();
}

class _DuaPlaylistScreenState extends State<DuaPlaylistScreen> {
  int selectedItem = 0;

  List<Map> prayerTime = [
    {'name': 'Islamic Dua 2', 'time': '5:38'},
    {'name': 'Islamic Dua 2', 'time': '5:48 '},
    {'name': 'Islamic Dua 2', 'time': '7:27 '},
    {'name': 'Islamic Dua 2', 'time': '11:46'},
    {'name': 'Islamic Dua 2', 'time': '4:05'},
    {'name': 'Islamic Dua 2', 'time': '4:20'},
    {'name': 'Islamic Dua 2', 'time': '10:56'},
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
                borderRadius:const BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                        },
                        icon:const Icon(Icons.arrow_back, color: AppColors.cWhite),
                      ),

                     const Text(
                        'Dua playlist',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Time Card-->
                  ListView.builder(
                    itemCount: prayerTime.length,
                    shrinkWrap: true,
                    padding:const EdgeInsets.all(0),
                    physics:const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      final data = prayerTime[index];
                      return InkWell(
                        onTap: () {
                          Get.to(() =>const DuaDetailsScreen());
                        },
                        child: Container(
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 16,
                                children: [
                                  Container(
                                    width: 58,
                                    height: 58,
                                    padding: const EdgeInsets.all(9),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Image.asset(AssetsIcons.play),
                                  ),
                                  Flexible(
                                    child: Text(
                                      data['name'],
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style:const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Text(
                                      'Play',
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
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
