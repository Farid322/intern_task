import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.onChanged,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.obscureText,
    this.validator,
    this.keyboardType,
  });
  final String labelText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        right: size.width * 0.04,
        left: size.width * 0.04,
        top: size.height * 0.02,
      ),
      child: TextFormField(
        validator: validator,
        obscureText: obscureText ?? false,
        onChanged: onChanged,
        keyboardType: keyboardType,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          labelText: labelText,
          // labelStyle: AppStyles.s18,
          border: getBorderStyle(),
          enabledBorder: getBorderStyle(),
          focusedBorder: getBorderStyle(),
        ),
      ),
    );
  }
}

OutlineInputBorder getBorderStyle() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4), borderSide: const BorderSide());
}
