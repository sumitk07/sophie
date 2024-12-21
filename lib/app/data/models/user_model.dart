import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String id;
  String fullName;
  String email;
  String? phone;
  bool isVerified;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    this.phone,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        isVerified: json["isVerified"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "isVerified": isVerified,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
