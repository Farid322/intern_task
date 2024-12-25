import 'package:flutter/material.dart';

import '../widgets/auth_header.dart';
import '../widgets/sign_in_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeader(),
            // const SizedBox(height: ),
            SignInForm()
          ],
        ),
      ),
    );
  }
}
