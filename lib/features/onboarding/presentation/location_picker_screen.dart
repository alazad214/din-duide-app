import 'package:din_guide_app/common_widgets/auth_appbar.dart';
import 'package:din_guide_app/common_widgets/custom_textfeild.dart';
import 'package:din_guide_app/constants/app_colors.dart';
import 'package:din_guide_app/features/onboarding/presentation/onboarding_screen1.dart';
import 'package:din_guide_app/helpers/di.dart';
import 'package:flutter/material.dart';
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
                Get.to(() => const OnboardingScreen1());
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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

            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCities.length,

                itemBuilder: (context, index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      leading: CircleAvatar(
                        radius: 14,
                        backgroundColor:
                            selectedLocation == filteredCities[index]
                                ? AppColors.cWhite
                                : AppColors.primaryColor,
                        child: Text(
                          (index + 1).toString(),
                          style: TextStyle(
                            color:
                                selectedLocation == filteredCities[index]
                                    ? AppColors.c0D1E40
                                    : AppColors.cWhite,
                          ),
                        ),
                      ),
                      title: Text(
                        filteredCities[index],
                        style: TextStyle(
                          fontSize: 16,
                          color:
                              selectedLocation == filteredCities[index]
                                  ? AppColors.cWhite
                                  : AppColors.c0D1E40,
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
            ),
          ],
        ),
      ),
    );
  }
}
