import 'dart:convert';

List<AppModel> appModelFromJson(String str) =>
    List<AppModel>.from(json.decode(str).map((x) => AppModel.fromJson(x)));

String appModelToJson(List<AppModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppModel {
  AppModel({
    this.response,
    this.profilepic,
    this.name,
    this.speciality,
    this.day,
    required this.date,
    this.timing,
  });

  String? response;
  String? profilepic;
  String? name;
  String? speciality;
  String? day;
  String date;
  String? timing;

  factory AppModel.fromJson(Map<String, dynamic> json) => AppModel(
        response: json["response"],
        profilepic: json["profilepic"],
        name: json["name"],
        speciality: json["speciality"],
        day: json["day"],
        date: json["date"],
        timing: json["timing"],
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        "profilepic": profilepic,
        "name": name,
        "speciality": speciality,
        "day": day,
        "date": date,
        "timing": timing,
      };
}


// To parse this JSON data, do
//
//     final appModel = AppModelFromJson(jsonString);