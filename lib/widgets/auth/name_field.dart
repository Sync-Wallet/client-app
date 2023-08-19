import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncwallet/contexts/contexts.dart';
import 'package:syncwallet/widgets/auth/email_field.dart';

class NameField extends StatelessWidget {
  const NameField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'What\'s your name?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
         SizedBox(height: 5),
          const Text(
            'Add your name so that friends can find you',
            style: TextStyle(
              color: Color.fromRGBO(254, 254, 254, 0.85),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 30),
          const TextField(
            autofocus: true,
            cursorColor: Colors.white,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              // hintText: 'Name',
              labelText: 'Name',
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
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: FilledButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false)
                    .setRegisterStep(RegisterStep.password);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffcef24b),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}