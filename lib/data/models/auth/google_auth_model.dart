import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';

class GoogleAuthModel {
  String? id;
  String? photoUrl;
  String? name;
  String? phoneNumber;

  GoogleAuthModel({
    this.id,
    this.name,
    this.phoneNumber,
    this.photoUrl,
  });

  GoogleAuthModel fromJson(Map<String, dynamic> json) {
    return GoogleAuthModel(
      id: json['id'],
      name: json['name'],
      photoUrl: json['photoUrl'],
      phoneNumber: json['phoneNumber'],
    );
  }

  GoogleAuthModel fromUserCred(User user) {
    return GoogleAuthModel(
        name: user.displayName ?? "",
        id: user.uid,
        phoneNumber: user.phoneNumber,
        photoUrl: user.refreshToken);
  }

  Map<String, dynamic> toJson(GoogleAuthModel model) {
    return {
      "id": model.id,
      "name": model.name,
      "photoUrl": model.photoUrl,
      "phoneNumber": model.phoneNumber,
    };
  }
}
