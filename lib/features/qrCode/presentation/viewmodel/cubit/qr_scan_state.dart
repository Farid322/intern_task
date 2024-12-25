abstract class QRScanState {
  const QRScanState();

  List<Object> get props => [];
}

class QRScanInitial extends QRScanState {}

class QRScanSaved extends QRScanState {
  final String result;

  const QRScanSaved({required this.result});

  @override
  List<Object> get props => [result];
}

class QRScanResultsLoaded extends QRScanState {
  final List<dynamic> results;

  const QRScanResultsLoaded({required this.results});

  @override
  List<Object> get props => [results];
}

class QRScanResultAdded extends QRScanState {
  final String result;

  const QRScanResultAdded({required this.result});

  @override
  List<Object> get props => [result];
}

class QRScanImagePicked extends QRScanState {
  final String filePath;

  const QRScanImagePicked({
    required this.filePath,
  });

  @override
  List<Object> get props => [filePath];
}

class PlaceCameraPressed extends QRScanState {
  final bool showImage;

  const PlaceCameraPressed({this.showImage = true});
}

class QRScanSuccess extends QRScanState {
  final String qrCode;
  QRScanSuccess({required this.qrCode});
}

class QRScanError extends QRScanState {
  final String errorMessage;
  QRScanError({required this.errorMessage});
}
