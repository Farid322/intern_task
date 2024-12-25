import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../viewmodel/cubit/qr_scan_cubit.dart';
import '../../viewmodel/cubit/qr_scan_state.dart';


class ResultListView extends StatelessWidget {
  const ResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocBuilder<QRScanCubit, QRScanState>(
      builder: (context, state) {
        if (state is QRScanResultsLoaded) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.results.length,
              itemBuilder: (context, index) {
                final result = state.results[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: Card(
                    color: AppColors.cardColor,
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
                    child: ListTile(
                      leading: Image.asset(AppAssets.fileIcon),
                      title: Text(result),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
