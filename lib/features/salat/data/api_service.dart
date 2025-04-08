import '../../../networks/endpoints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/prayers_model.dart';

class PrayerService {
  Future<PrayersModel> fetchPrayerTimes(String city, date) async {
    try {
      final response = await http.get(Uri.parse('$salatUrl/$city/weekly/$date.json'));
      print('API Response: ${response.body}');

      if (response.statusCode == 200) {
        return PrayersModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load prayer times: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load prayer times: $e');
    }
  }
}