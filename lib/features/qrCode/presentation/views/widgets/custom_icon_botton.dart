import 'package:flutter/material.dart';

class CustomIconBotton extends StatelessWidget {
  const CustomIconBotton({super.key, required this.icon, this.onPressed});
  final Widget icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
    );
  }
}
