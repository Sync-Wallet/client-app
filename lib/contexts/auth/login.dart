import 'package:flutter/foundation.dart';

class LoginController extends ChangeNotifier {
  String _email = '';
  String _password = '';

  String get email => _email;
  String get password => _password;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void login() {
    if (_email == '' || _password == '') {
      throw Exception('Email and password are required');
    }


  }
}