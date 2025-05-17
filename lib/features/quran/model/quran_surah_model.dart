class QuranSurahModel {
  String? message;
  int? number;
  List<SurahList>? surahList;

  QuranSurahModel({this.message, this.number, this.surahList});

  QuranSurahModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    number = json['number'];
    if (json['surahList'] != null) {
      surahList = <SurahList>[];
      json['surahList'].forEach((v) {
        surahList!.add(SurahList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['number'] = number;
    if (surahList != null) {
      data['surahList'] = surahList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SurahList {
  int? number;
  String? name;
  String? bangla;
  String? source;

  SurahList({this.number, this.name, this.bangla, this.source});

  SurahList.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    bangla = json['bangla'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['name'] = name;
    data['bangla'] = bangla;
    data['source'] = source;
    return data;
  }
}
