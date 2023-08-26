import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncwallet/contexts/contexts.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Create a password',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 2),
          const Text(
            'Create a password with at least 6 letters or numbers. It should be something others can\'t guess.',
            style: TextStyle(
              color: Color.fromRGBO(254, 254, 254, 0.85),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 30),
          TextField(
            autofocus: true,
            obscureText: true,
            onChanged: (value) {
              Provider.of<AuthProvider>(context, listen: false).setPassword(value);
            },
            cursorColor: Colors.white,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(
                color: Color.fromRGBO(254, 254, 254, 0.5),
                fontSize: 16,
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
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: FilledButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false)
                    .setRegisterStep(RegisterStep.username);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffcef24b),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}