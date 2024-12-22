import 'dart:core';

import 'package:taskflow/data/models/auth/google_auth_model.dart';

class UserModel {
  String? id;
  String? photoUrl;
  String? name;
  String? phoneNumber;

  UserModel({
    this.id,
    this.name,
    this.phoneNumber,
    this.photoUrl,
  });

  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      photoUrl: json['photoUrl'],
      phoneNumber: json['phoneNumber'],
    );
  }

  factory UserModel.fromGoogleAuthModel(GoogleAuthModel? user) {
    return UserModel(
        name: user?.name ?? "",
        id: user?.id,
        phoneNumber: user?.phoneNumber,
        photoUrl: user?.photoUrl);
  }

  Map<String, dynamic> toJson(UserModel model) {
    return {
      "id": model.id,
      "name": model.name,
      "photoUrl": model.photoUrl,
      "phoneNumber": model.phoneNumber,
    };
  }
}
