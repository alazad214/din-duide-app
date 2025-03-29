import 'dart:convert';

class ProfileModelResponse {
  bool? success;
  ProfileData? data;

  ProfileModelResponse({
    this.success,
    this.data,
  });

  factory ProfileModelResponse.fromRawJson(String str) =>
      ProfileModelResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileModelResponse.fromJson(Map<String, dynamic> json) =>
      ProfileModelResponse(
        success: json["success"],
        data: ProfileData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data!.toJson(),
      };
}

class ProfileData {
  int? id;
  String? firstName;
  String? lastName;
  String? userName;
  String? email;

  dynamic image;
  String? gender;
  String? dateofbirth;

  int? isVerified;

  ProfileData({
    this.id,
    this.firstName,
    this.lastName,
    this.userName,
    this.email,
    this.image,
    this.gender,
    this.dateofbirth,
    this.isVerified,
  });

  factory ProfileData.fromRawJson(String str) =>
      ProfileData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        userName: json["user_name"],
        email: json["email"],
        image: json["image"],
        gender: json["gender"],
        dateofbirth: json["dateofbirth"],
        isVerified: json["is_verified"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "user_name": userName,
        "email": email,
        "image": image,
        "gender": gender,
        "dateofbirth": dateofbirth,
        "is_verified": isVerified,
      };
}
