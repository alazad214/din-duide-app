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
        surah!.add(new Surah.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['surahName'] = this.surahName;
    data['verse'] = this.verse;
    data['audio'] = this.audio;
    data['bismillah'] = this.bismillah;
    if (this.surah != null) {
      data['surah'] = this.surah!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verse'] = this.verse;
    data['arabic'] = this.arabic;
    data['bangla'] = this.bangla;
    data['english'] = this.english;
    return data;
  }
}
