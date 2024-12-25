import 'package:flutter/material.dart';


class HeaderIconBotton extends StatelessWidget {
  const HeaderIconBotton({
    super.key,
    this.headerIcon,
    this.onTap,
  });
  final Widget? headerIcon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: GestureDetector(
          onTap: onTap,
          child: headerIcon,
        ),
      ),
    );
  }
}
