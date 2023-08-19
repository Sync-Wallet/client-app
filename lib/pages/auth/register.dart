import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:syncwallet/widgets/auth/name_field.dart';
import 'package:syncwallet/widgets/auth/username_field.dart';
import 'package:syncwallet/widgets/auth/email_field.dart';
import 'package:syncwallet/widgets/auth/otp_field.dart';
import 'package:syncwallet/widgets/auth/password_field.dart';
import 'package:syncwallet/contexts/authProvider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                RegisterStep step = Provider.of<AuthProvider>(context, listen: false).registerStep;

                if (step == RegisterStep.password) {
                  Provider.of<AuthProvider>(context, listen: false).setRegisterStep(RegisterStep.name);
                } else if (step == RegisterStep.username) {
                  Provider.of<AuthProvider>(context, listen: false).setRegisterStep(RegisterStep.password);
                } else if (step == RegisterStep.email) {
                  Provider.of<AuthProvider>(context, listen: false).setRegisterStep(RegisterStep.username);
                } else if (step == RegisterStep.otp) {
                  Provider.of<AuthProvider>(context, listen: false).setRegisterStep(RegisterStep.email);
                }  else if (step == RegisterStep.name) {
                }
              },
            ),
            SizedBox(height: 10),
            Consumer<AuthProvider>(
              builder: (context, authData, child) {
                Widget w = NameField();
                if (authData.registerStep == RegisterStep.name) {
                  w = NameField();
                } else if (authData.registerStep == RegisterStep.username) {
                  w = UsernameField();
                } else if (authData.registerStep == RegisterStep.email) {
                  w = EmailField();
                } else if (authData.registerStep == RegisterStep.otp) {
                  w = OTPField();
                } else if (authData.registerStep == RegisterStep.password) {
                  w = PasswordField();
                }
                return w;
              },
            ),
          ],
        ),
      ),
    );
  }
}
