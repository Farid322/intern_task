// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/navigation.dart';
import '../../../../../core/routes/router_names.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../viewmodel/cubit/qr_scan_cubit.dart';
import 'custom_icon_botton.dart';


class ScanningOptionsWidget extends StatelessWidget {
  const ScanningOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconBotton(
          icon: Image.asset(AppAssets.galary),
          onPressed: () async {
            await context.read<QRScanCubit>().pickImage();
            customReplacementNavigate(context, RouterNames.qRScanResultView);
          },
        ),
        CustomIconBotton(
          icon: Image.asset(AppAssets.blurLinear),
        ),
        CustomIconBotton(
          icon: Image.asset(AppAssets.flash),
          onPressed: () {
            context.read<QRScanCubit>().toggleFlash();
          },
        ),
      ],
    );
  }
}
