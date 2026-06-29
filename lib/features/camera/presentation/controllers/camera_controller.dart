import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/camera_entity.dart';

/// State definition for Camera presentation layer
class CameraState {
  final bool isLoading;
  final CameraEntity? data;
  final String? errorMessage;

  const CameraState({
    this.isLoading = false,
    this.data,
    this.errorMessage,
  });

  CameraState copyWith({
    bool? isLoading,
    CameraEntity? data,
    String? errorMessage,
  }) {
    return CameraState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/// Riverpod StateNotifier managing the Camera view state
class CameraNotifier extends StateNotifier<CameraState> {
  CameraNotifier() : super(const CameraState());

  void loadData() {
    state = state.copyWith(isLoading: true);
    // Offline simulation delay
    Future.delayed(const Duration(milliseconds: 500), () {
      state = state.copyWith(
        isLoading: false,
        data: CameraEntity(id: 'mock_${DateTime.now().millisecondsSinceEpoch}'),
      );
    });
  }
}

/// Riverpod Provider for the CameraNotifier
final cameraProvider = StateNotifierProvider<CameraNotifier, CameraState>((ref) {
  return CameraNotifier();
});
