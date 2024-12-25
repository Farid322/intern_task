// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/routes/router_names.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_botton.dart';
import '../viewmodel/cubit/qr_scan_cubit.dart';
import '../viewmodel/cubit/qr_scan_state.dart';
import 'widgets/qr_list_icon_botton_widget.dart';
import 'widgets/qr_scan_widget.dart';
import 'widgets/scanning_options_widget.dart';


class QRScanScreen extends StatelessWidget {
  const QRScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.15),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.008,
                  ),
                  Image.asset(AppAssets.rectangle),
                  SizedBox(height: size.height * 0.008),
                  HeaderIconBotton(
                    headerIcon: Image.asset(AppAssets.listIcon),
                    onTap: () {
                      customReplacementNavigate(
                          context, RouterNames.qRScanResultView);
                    },
                  ),
                  SizedBox(height: size.height * 0.07),
                  const Text(
                    AppStrings.scanQrCode,
                    style: AppStyles.s16,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.15),
                    child: const Text(
                      AppStrings.scanDiscription,
                      style: AppStyles.s12,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: size.height * 0.06),
                  BlocBuilder<QRScanCubit, QRScanState>(
                    builder: (context, state) {
                      if (state is PlaceCameraPressed) {
                        return const QrScanWidget();
                      } else {
                        return Image.asset(
                          AppAssets.bigQrScan,
                          width: size.width * 0.4,
                          height: size.height * 0.2,
                        );
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.01),
                  const Text(
                    AppStrings.scannigCode,
                    style: AppStyles.s12,
                  ),
                  SizedBox(height: size.height * 0.01),
                  const ScanningOptionsWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: CustomBotton(
                      buttonColor: AppColors.primaryColor,
                      text: AppStrings.placeCamera,
                      onPressed: () {
                        BlocProvider.of<QRScanCubit>(context).toggelCamera();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
