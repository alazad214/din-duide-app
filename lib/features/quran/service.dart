import 'dart:convert';
import 'package:din_guide_app/features/quran/model/quran_details_model.dart';
import 'package:din_guide_app/core/networks/endpoints.dart';
import 'package:http/http.dart' as http;

class QuranDetailsService {
  Future<ShurahDetailsModel> getSurah(String shurahName) async {
    try {
      final response = await http.get(
        Uri.parse('$quranDetials$shurahName'),
        headers: {
          'X-RapidAPI-Host': 'online-quran-api.p.rapidapi.com',
          'X-RapidAPI-Key': 'fc04e11871msha9bf6fcd30d0e61p1395c2jsn8f26b0a94145',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return ShurahDetailsModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to load Surah details');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
