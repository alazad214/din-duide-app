import 'package:din_guide_app/common_widgets/auth_appbar.dart';
import 'package:din_guide_app/common_widgets/custom_textfeild.dart';
import 'package:din_guide_app/constants/app_colors.dart';
import 'package:din_guide_app/constants/text_font_style.dart';
import 'package:din_guide_app/helpers/di.dart';
import 'package:din_guide_app/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:din_guide_app/features/salat/data/citys.dart';
import 'package:toastification/toastification.dart';

class LocationPickerScreen extends StatefulWidget {
  const LocationPickerScreen({super.key});

  @override
  LocationPickerScreenState createState() => LocationPickerScreenState();
}

class LocationPickerScreenState extends State<LocationPickerScreen> {
  String? selectedLocation;
  List<String> filteredCities = List.from(citys);
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSelectedLocation();
    searchController.addListener(_filterCities);
  }

  void _loadSelectedLocation() async {
    final location = appData.read('selectedLocation');
    setState(() {
      selectedLocation = location;
    });
  }

  _saveSelectedLocation(String location) async {
    appData.write('selectedLocation', location);
  }

  _filterCities() {
    setState(() {
      filteredCities =
          citys
              .where(
                (city) => city.toLowerCase().contains(
                  searchController.text.toLowerCase(),
                ),
              )
              .toList();
    });
  }

  @override
  void dispose() {
    searchController.removeListener(_filterCities);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'লোকেশন নির্বাচন করুন',
        leadingVisible: false,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              if (selectedLocation != null) {
                Get.to(() => const NavigationScreen());
              } else {
                toastification.show(
                  title: const Text('Something went wrong!'),
                  description: const Text(
                    'Please select a location before proceeding.',
                  ),
                  type: ToastificationType.warning,
                );
              }
            },
            icon: const Icon(Iconsax.tick_circle, color: AppColors.cWhite),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextfield(
              controller: searchController,
              hintText: 'Search for a city...',
              prefixIcon: const Icon(
                Iconsax.search_normal,
                color: Colors.black26,
              ),
            ),

            const SizedBox(height: 16),
            ListView.builder(
              itemCount: filteredCities.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              itemBuilder: (context, index) {
                return Container(
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color:
                        selectedLocation == filteredCities[index]
                            ? AppColors.primaryColor
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.cC0C0C0C),
                  ),

                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    trailing:
                        selectedLocation == filteredCities[index]
                            ? const Icon(
                              Icons.check_circle,
                              color: AppColors.cWhite,
                            )
                            : null,
                    leading: CircleAvatar(
                      radius: 14,
                      backgroundColor:
                          selectedLocation == filteredCities[index]
                              ? AppColors.cWhite
                              : AppColors.c4B4B4B,

                      child: Text(
                        (index + 1).toString(),
                        style: TextFontStyle.textStyle14w500c242424.copyWith(
                          color:
                              selectedLocation == filteredCities[index]
                                  ? AppColors.c000000
                                  : AppColors.cWhite,
                        ),
                      ),
                    ),
                    title: Text(
                      filteredCities[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color:
                            selectedLocation == filteredCities[index]
                                ? AppColors.cWhite
                                : AppColors.c818181,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectedLocation = filteredCities[index];
                      });
                      _saveSelectedLocation(filteredCities[index]);
                    },
                    selected: selectedLocation == filteredCities[index],
                    selectedTileColor: AppColors.primaryColor,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
