import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum AuthMode { none, loading }
const baseURL = 'https://localhost:3000/api/v1';

class AuthProvider extends ChangeNotifier {
  String _name = '';
  String _password = '';
  String _email = '';
  String _username = '';
  String _otp = '';
  String _token = '';
  // bool _showMessage = false;
  String _message = '';
  AuthMode _authMode = AuthMode.none;

  String get name => _name;
  String get password => _password;
  String get email => _email;
  String get username => _username;
  String get otp => _otp;
  String get token => _token;
  String get message => _message;
  AuthMode get authMode => _authMode;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setOTP(String otp) {
    _otp = otp;
    notifyListeners();
  }

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  void setAuthMode(AuthMode authMode) {
    _authMode = authMode;
    notifyListeners();
  }

  void reset() {
    _name = '';
    _password = '';
    _email = '';
    _username = '';
    _otp = '';
    _token = '';
    _authMode = AuthMode.none;
    notifyListeners();
  }

  void resetAuthMode() {
    _authMode = AuthMode.none;
    notifyListeners();
  }

  void resetOTP() {
    _otp = '';
    notifyListeners();
  }

  void resetPassword() {
    _password = '';
    notifyListeners();
  }

  void resetToken() {
    _token = '';
    notifyListeners();
  }

  Future<void> login() async{
    _authMode = AuthMode.loading;
    if (_email == '' || _name == '') {
      _authMode = AuthMode.none;
      return;
    }

    final url = Uri.parse('$baseURL/login');
    final headers = {'Content-Type': 'application/json'};
    final body = {
      'email': _email,
      'password': _password,
    };

    final response = await http.post(url, headers: headers, body: jsonEncode(body));

    _message = 'done';

    print(response);


    notifyListeners();
  }

}