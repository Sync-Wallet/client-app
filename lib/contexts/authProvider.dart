import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum AuthMode { none, loading }
enum RegisterStep {name, email, username, password, otp}
const baseURL = 'http://192.168.1.3:3000/api/v1/auth';

class AuthProvider extends ChangeNotifier {
  String _id = '';
  String _name = '';
  String _password = '';
  String _email = '';
  String _username = '';
  String _otp = '';
  String _token = '';
  bool _isVerified = false;
  String _message = '';
  AuthMode _authMode = AuthMode.none;
  RegisterStep _registerStep = RegisterStep.name;

  // getters
  String get id => _id;
  String get name => _name;
  String get password => _password;
  String get email => _email;
  String get username => _username;
  String get otp => _otp;
  String get token => _token;
  bool get isVerified => _isVerified;
  String get message => _message;
  RegisterStep get registerStep => _registerStep;
  AuthMode get authMode => _authMode;


  // setters
  void setId(String id) {
    _id = id;
    notifyListeners();
  }

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

  void setIsVerified(bool isVerified) {
    _isVerified = isVerified;
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

  void setMessage(String message) {
    _message = message;
    notifyListeners();
  }

  void setRegisterStep(RegisterStep registerStep) {
    _registerStep = registerStep;
    notifyListeners();
  }

  void setAuthMode(AuthMode authMode) {
    _authMode = authMode;
    notifyListeners();
  }

  void reset() {
    _id = '';
    _name = '';
    _password = '';
    _email = '';
    _username = '';
    _otp = '';
    _token = '';
    _isVerified = false;
    _message = '';
    _registerStep = RegisterStep.name;
    _authMode = AuthMode.none;
    notifyListeners();
  }

  void resetAuthMode() {
    _authMode = AuthMode.none;
    notifyListeners();
  }

  Future<void> login() async{
    _authMode = AuthMode.loading;
    if (_email == '' || _password == '') {
      _authMode = AuthMode.none;
      return;
    }

    final url = Uri.parse('$baseURL/login');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_token',
    };
    final body = {
      'email': _email,
      'password': _password,
    };

    http.Response response = await http.post(url, headers: headers, body: jsonEncode(body));
    final res = await jsonDecode(response.body);

    // print(res);
    setToken(res['token']);
    setId(res['user']['_id']);
    setName(res['user']['name']);
    setEmail(res['user']['email']);
    setUsername(res['user']['username']);
    setIsVerified(res['user']['isVerified']);
    setAuthMode(AuthMode.none);

    notifyListeners();
  }

}