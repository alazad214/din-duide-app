class ShurahDetailsModel {
  String? surahName;
  int? verse;
  String? audio;
  String? bismillah;
  List<Surah>? surah;

  ShurahDetailsModel(
      {this.surahName, this.verse, this.audio, this.bismillah, this.surah});

  ShurahDetailsModel.fromJson(Map<String, dynamic> json) {
    surahName = json['surahName'];
    verse = json['verse'];
    audio = json['audio'];
    bismillah = json['bismillah'];
    if (json['surah'] != null) {
      surah = <Surah>[];
      json['surah'].forEach((v) {
        surah!.add(Surah.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['surahName'] = surahName;
    data['verse'] = verse;
    data['audio'] = audio;
    data['bismillah'] = bismillah;
    if (surah != null) {
      data['surah'] = surah!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Surah {
  int? verse;
  String? arabic;
  String? bangla;
  String? english;

  Surah({this.verse, this.arabic, this.bangla, this.english});

  Surah.fromJson(Map<String, dynamic> json) {
    verse = json['verse'];
    arabic = json['arabic'];
    bangla = json['bangla'];
    english = json['english'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['verse'] = verse;
    data['arabic'] = arabic;
    data['bangla'] = bangla;
    data['english'] = english;
    return data;
  }
}
