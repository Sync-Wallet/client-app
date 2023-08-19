import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncwallet/contexts/contexts.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Consumer<AuthProvider>(builder: (context, authData, child) {
              return TextField(
                onChanged: (value) {
                  authData.setEmail(value); // Update the state
                },
                autofocus: true,
                cursorColor: Colors.white,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(254, 254, 254, 0.5),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  filled: true,
                  fillColor: Color.fromRGBO(30, 28, 36, 1),
                  border: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                ),
              );
            }),
            SizedBox(height: 20),
            Consumer<AuthProvider>(builder: (context, authData, child) {
              return TextField(
                onChanged: (value) {
                  authData.setPassword(value); // Update the state
                },
                autofocus: true,
                obscureText: true,
                cursorColor: Colors.white,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(254, 254, 254, 0.5),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  filled: true,
                  fillColor: Color.fromRGBO(30, 28, 36, 1),
                  border: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                ),
              );
            }),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Consumer<AuthProvider>(builder: (context, authData, child) {
                return FilledButton(
                  onPressed: authData.login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffcef24b),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }),
            ),
            Consumer<AuthProvider>(
              builder: (context, authData, child) {
                return Column(
                  children: [
                    Text('Email: ${authData.email}',
                        style: TextStyle(color: Colors.white)),
                    Text('Password: ${authData.password}',
                        style: TextStyle(color: Colors.white)),
                  ],
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}
