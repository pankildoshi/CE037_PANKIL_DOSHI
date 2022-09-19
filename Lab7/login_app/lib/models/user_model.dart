import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? userId;
  String? email;
  String? firstName;
  String? lastName;

  // fetching data from firestore
  UserModel({this.userId, this.email, this.firstName, this.lastName});
  factory UserModel.fromMap(user) {
    return UserModel(
        userId: user['userId'],
        email: user['email'],
        firstName: user['firstName'],
        lastName: user['lastName']);
  }

  // sending data to firestore
  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "email": email,
      "firstName": firstName,
      "lastName": lastName
    };
  }
}
