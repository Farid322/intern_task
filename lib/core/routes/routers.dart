import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/login_screen.dart';
import '../../features/qrCode/presentation/viewmodel/cubit/qr_scan_cubit.dart';
import '../../features/qrCode/presentation/views/qr_result.dart';
import '../../features/qrCode/presentation/views/scan_view.dart';
import 'router_names.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RouterNames.signIn,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RouterNames.scanView,
      builder: (context, state) => BlocProvider(
        create: (context) => QRScanCubit(),
        child: const QRScanScreen(),
      ),
    ),
    GoRoute(
        path: RouterNames.qRScanResultView,
        builder: (context, state) => BlocProvider(
              create: (context) => QRScanCubit(),
              child: const QRScanResultView(),
            )),
  ],
);
