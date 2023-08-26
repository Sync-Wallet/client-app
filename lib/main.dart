import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncwallet/constants.dart';
import 'package:syncwallet/pages/pages.dart';
import 'package:syncwallet/contexts/contexts.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final loggedIn =  Provider.of<AuthProvider>(context, listen: false).loggedIn;
    return MaterialApp(
      title: 'flutter sign in sign up ui',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Color(0xffcef24b),
          ),
        ),
        // primarySwatch: Colors.blue,
        // primaryColor: ,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: loggedIn ? HomePage() : AuthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
