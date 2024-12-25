import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.35,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: -0,
            left: 0,
            child: SvgPicture.asset(AppAssets.circale1),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(AppAssets.circale2),
          ),
          Positioned(
            top: size.height * 0.15,
            right: size.width * 0.4,
            child: const Text(
              AppStrings.logIn,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
