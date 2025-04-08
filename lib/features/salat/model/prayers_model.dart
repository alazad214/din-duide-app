class PrayersModel {
  String? title;
  String? query;
  String? prayersModelFor;
  int? method;
  String? prayerMethodName;
  dynamic daylight;
  dynamic timezone;
  String? mapImage;
  String? sealevel;
  TodayWeather? todayWeather;
  String? link;
  String? qiblaDirection;
  String? latitude;
  String? longitude;
  String? address;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  String? countryCode;
  List<Item>? items;
  int? statusValid;
  int? statusCode;
  String? statusDescription;

  PrayersModel({
    this.title,
    this.query,
    this.prayersModelFor,
    this.method,
    this.prayerMethodName,
    this.daylight,
    this.timezone,
    this.mapImage,
    this.sealevel,
    this.todayWeather,
    this.link,
    this.qiblaDirection,
    this.latitude,
    this.longitude,
    this.address,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.countryCode,
    this.items,
    this.statusValid,
    this.statusCode,
    this.statusDescription,
  });

  // Factory constructor to create a PrayersModel from a JSON map
  factory PrayersModel.fromJson(Map<String, dynamic> json) {
    return PrayersModel(
      title: json['title'],
      query: json['query'],
      prayersModelFor: json['for'],
      method: json['method'],
      prayerMethodName: json['prayer_method_name'],
      daylight: json['daylight'],
      timezone: json['timezone'],
      mapImage: json['map_image'],
      sealevel: json['sealevel'],
      todayWeather:
          json['today_weather'] != null
              ? TodayWeather.fromJson(json['today_weather'])
              : null,
      link: json['link'],
      qiblaDirection: json['qibla_direction'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postal_code'],
      country: json['country'],
      countryCode: json['country_code'],
      items:
          json['items'] != null
              ? List<Item>.from(json['items'].map((x) => Item.fromJson(x)))
              : [],
      statusValid: json['status_valid'],
      statusCode: json['status_code'],
      statusDescription: json['status_description'],
    );
  }
}

class Item {
  String? dateFor;
  String? fajr;
  String? shurooq;
  String? dhuhr;
  String? asr;
  String? maghrib;
  String? isha;

  Item({
    this.dateFor,
    this.fajr,
    this.shurooq,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
  });

  // Factory constructor to create an Item from a JSON map
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      dateFor: json['date_for'],
      fajr: json['fajr'],
      shurooq: json['shurooq'],
      dhuhr: json['dhuhr'],
      asr: json['asr'],
      maghrib: json['maghrib'],
      isha: json['isha'],
    );
  }
}

class TodayWeather {
  dynamic pressure;
  String? temperature;

  TodayWeather({this.pressure, this.temperature});

  // Factory constructor to create TodayWeather from a JSON map
  factory TodayWeather.fromJson(Map<String, dynamic> json) {
    return TodayWeather(
      pressure: json['pressure'],
      temperature: json['temperature'],
    );
  }
}