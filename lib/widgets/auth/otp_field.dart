import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncwallet/contexts/contexts.dart';
import 'package:syncwallet/pages/home_page.dart';


class OTPField extends StatelessWidget {
  const OTPField({super.key});

  @override
  Widget build(BuildContext context) {
    String email = Provider.of<AuthProvider>(context,listen: false).email;
    if (email == '') email = 'your email';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Enter the confirmation code',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),

          Text(
            'To confirm your account, enter the 6-digt code that we sent to $email.',
            style: TextStyle(
              color: Color.fromRGBO(254, 254, 254, 0.85),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 30),
          TextField(
            onChanged: (value) {
              Provider.of<AuthProvider>(context, listen: false).setOTP(value);
            },
            keyboardType: TextInputType.number,
            autofocus: true,
            cursorColor: Colors.white,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              // hintText: 'Name',
              labelText: 'OTP',
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
                final authData = Provider.of<AuthProvider>(context, listen: false);
                authData.verify();
                if (authData.isVerified) {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
                }
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
