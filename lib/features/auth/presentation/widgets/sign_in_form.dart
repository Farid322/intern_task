import 'package:flutter/material.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/routes/router_names.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_botton.dart';
import 'custom_text_form_field.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  bool obscurePasswordTextValue = true;

  void _togglePasswordVisibility() {
    setState(() {
      obscurePasswordTextValue = !obscurePasswordTextValue;
    });
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    }

    if (value.length < 9 || value.length > 15) {
      return 'Please enter a valid mobile number';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      customReplacementNavigate(context, RouterNames.scanView);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: Column(
          children: [
            CustomTextFormField(
              labelText: AppStrings.enterYourPhone,
              validator: _validatePhone,
              keyboardType: TextInputType.number,
            ),
            CustomTextFormField(
              suffixIcon: IconButton(
                onPressed: _togglePasswordVisibility,
                icon: Icon(
                  obscurePasswordTextValue == true
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
              labelText: AppStrings.password,
              validator: _validatePassword,
              obscureText: obscurePasswordTextValue,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.04),
              child: const Align(
                alignment: Alignment.centerRight,
                child: Text(AppStrings.forgetPassword),
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: CustomBotton(
                buttonColor: AppColors.primaryColor,
                text: AppStrings.logIn,
                onPressed: _submitForm,
              ),
            )
          ],
        ),
      ),
    );
  }
}
