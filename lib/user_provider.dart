import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String uid = '';
  String email = '';
  // String username = '';

  void setUser(String uid, String email) {
    this.uid = uid;
    this.email = email;
    // this.username = username;
    notifyListeners();
  }
}
