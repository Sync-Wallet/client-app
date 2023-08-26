import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

enum AuthMode { none, loading }
enum RegisterStep {name, email, username, password, otp}
const baseURL = 'http://192.168.1.7:3000/api/v1/auth';

class AuthProvider extends ChangeNotifier {
  String _id = '';
  String _name = '';
  String _password = '';
  String _email = '';
  String _username = '';
  String _otp = '';
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
  bool get isVerified => _isVerified;
  String get message => _message;
  RegisterStep get registerStep => _registerStep;
  AuthMode get authMode => _authMode;
  Future<String> get token async {
    final storage = await SharedPreferences.getInstance();
    return storage.getString('token') ?? '';
  }

  bool get loggedIn {
    final _token = token;
    return true;
  }
  // TODO: loggedIn

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

  Future<void> setToken(String token) async {
    final storage = await SharedPreferences.getInstance();
    storage.setString('token', token);
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
    if (email == '' || password == '') {
      setAuthMode(AuthMode.none);
      return;
    }

    final url = Uri.parse('$baseURL/login');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final body = {
      'email': email,
      'password': password,
    };

    http.Response response = await http.post(url, headers: headers, body: jsonEncode(body));
    final res = await jsonDecode(response.body);

    // print(res);
    setToken(res['token']);
    setId(res['user']['_id']);
    setName(res['user']['name']);
    setUsername(res['user']['username']);
    setIsVerified(res['user']['isVerified']);
    setAuthMode(AuthMode.none);

    notifyListeners();
  }

  Future<void> register() async {
    setAuthMode(AuthMode.loading);
    if (email == '' || password == '' || username == '' || name == '') {
      setAuthMode(AuthMode.none);
      return;
    }

    final url = Uri.parse('$baseURL/register');
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = {
      'email': email,
      'password': password,
      'username': username,
      'name': name,
    };

    http.Response response = await http.post(url, headers: headers, body: jsonEncode(body));

    final res = await jsonDecode(response.body);
    if (!res['success']) {
      setAuthMode(AuthMode.none);
      return;
    }
  }

  Future<void> verify() async {
    setAuthMode(AuthMode.loading);
    final url = Uri.parse('$baseURL/verify');
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = {
      'email': email,
      'otp': otp,
    };

    http.Response otpResponse = await http.post(url, headers: headers, body: jsonEncode(body));
    final res = await jsonDecode(otpResponse.body);
    if (!res['success']) {
      setAuthMode(AuthMode.none);
      return;
    }

    setId(res['user']['_id']);
    setIsVerified(res['user']['isVerified']);
    setToken(res['token']);
    setAuthMode(AuthMode.none);
  }
}

// TODO 1: otp api must receive password too to avoid sending otp to wrong email