import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Color(0xffcef24b),
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}