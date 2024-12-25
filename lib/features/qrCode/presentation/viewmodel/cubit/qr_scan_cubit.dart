// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


import 'qr_scan_state.dart';

class QRScanCubit extends Cubit<QRScanState> {
  QRScanCubit() : super(QRScanInitial());

  final Box qrResultsBox = Hive.box('qrResults');
  QRViewController? controller;
  bool isControllerClosed = false;

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      saveScanResult(scanData.code!);
      if (!isControllerClosed) {
        emit(QRScanSaved(result: scanData.code!));
      }
    });
  }

  void saveScanResult(String result) async {
    await qrResultsBox.add(result);
    emit(QRScanResultAdded(result: result));
  }

  void loadScanResults() {
    final results = qrResultsBox.values.toList();
    emit(QRScanResultsLoaded(results: results));
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      emit(QRScanImagePicked(filePath: pickedFile.path));
      saveScanResult(pickedFile.path);
    }
  }

  void toggleFlash() {
    controller?.toggleFlash();
  }

  void toggelCamera() {
    emit(const PlaceCameraPressed());
  }
}
