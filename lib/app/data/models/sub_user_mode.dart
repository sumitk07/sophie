// To parse this JSON data, do
//
//     final subUserModel = subUserModelFromJson(jsonString);

import 'dart:convert';

SubUserModel subUserModelFromJson(String str) =>
    SubUserModel.fromJson(json.decode(str));

String subUserModelToJson(SubUserModel data) => json.encode(data.toJson());

class SubUserModel {
  String id;
  String userId;
  bool subUserModelDefault;
  String fullName;
  String gender;
  String profileImage;
  DateTime dateOfBirth;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  SubUserModel({
    required this.id,
    required this.userId,
    required this.subUserModelDefault,
    required this.fullName,
    required this.gender,
    required this.profileImage,
    required this.dateOfBirth,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory SubUserModel.fromJson(Map<String, dynamic> json) => SubUserModel(
        id: json["_id"],
        userId: json["userId"],
        subUserModelDefault: json["default"],
        fullName: json["fullName"],
        gender: json["gender"],
        profileImage: json["profileImage"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "default": subUserModelDefault,
        "fullName": fullName,
        "gender": gender,
        "profileImage": profileImage,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
