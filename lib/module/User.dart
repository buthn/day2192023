import 'dart:io';

class User{
  String? name;
  String? email;
  String? phone;
  String? gender;
  String? profileImage;

  User({this.name, this.email, this.phone, this.gender, this.profileImage});

  Map<String,dynamic> toMap() {
    return {
      "name":name,
      "email":email,
      "phone":phone,
      "gender":gender

    };
  }
}