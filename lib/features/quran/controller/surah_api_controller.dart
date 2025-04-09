import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:din_guide_app/features/quran/model/quran_surah_model.dart';
import 'package:get/get.dart';

class SurahApiController extends GetxController {
  var isLoading = true.obs;
  var quranData = QuranSurahModel().obs;

  Future<void> getSurah() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('https://online-quran-api.p.rapidapi.com/surahs'),
        headers: {
          'X-RapidAPI-Host': 'online-quran-api.p.rapidapi.com',
          'X-RapidAPI-Key':
              'fc04e11871msha9bf6fcd30d0e61p1395c2jsn8f26b0a94145',
        },
      );

      if (response.statusCode == 200) {
        quranData.value = QuranSurahModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load Surahs');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getSurah();
  }
}
