import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/audio_entity.dart';

/// State definition for Audio presentation layer
class AudioState {
  final bool isLoading;
  final AudioEntity? data;
  final String? errorMessage;

  const AudioState({
    this.isLoading = false,
    this.data,
    this.errorMessage,
  });

  AudioState copyWith({
    bool? isLoading,
    AudioEntity? data,
    String? errorMessage,
  }) {
    return AudioState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/// Riverpod StateNotifier managing the Audio view state
class AudioNotifier extends StateNotifier<AudioState> {
  AudioNotifier() : super(const AudioState());

  void loadData() {
    state = state.copyWith(isLoading: true);
    // Offline simulation delay
    Future.delayed(const Duration(milliseconds: 500), () {
      state = state.copyWith(
        isLoading: false,
        data: AudioEntity(id: 'mock_${DateTime.now().millisecondsSinceEpoch}'),
      );
    });
  }
}

/// Riverpod Provider for the AudioNotifier
final audioProvider = StateNotifierProvider<AudioNotifier, AudioState>((ref) {
  return AudioNotifier();
});
