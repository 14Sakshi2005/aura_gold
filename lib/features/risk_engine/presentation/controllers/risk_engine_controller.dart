import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/risk_engine_entity.dart';

/// State definition for RiskEngine presentation layer
class RiskEngineState {
  final bool isLoading;
  final RiskEngineEntity? data;
  final String? errorMessage;

  const RiskEngineState({
    this.isLoading = false,
    this.data,
    this.errorMessage,
  });

  RiskEngineState copyWith({
    bool? isLoading,
    RiskEngineEntity? data,
    String? errorMessage,
  }) {
    return RiskEngineState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/// Riverpod StateNotifier managing the RiskEngine view state
class RiskEngineNotifier extends StateNotifier<RiskEngineState> {
  RiskEngineNotifier() : super(const RiskEngineState());

  void loadData() {
    state = state.copyWith(isLoading: true);
    // Offline simulation delay
    Future.delayed(const Duration(milliseconds: 500), () {
      state = state.copyWith(
        isLoading: false,
        data: RiskEngineEntity(id: 'mock_${DateTime.now().millisecondsSinceEpoch}'),
      );
    });
  }
}

/// Riverpod Provider for the RiskEngineNotifier
final riskEngineProvider = StateNotifierProvider<RiskEngineNotifier, RiskEngineState>((ref) {
  return RiskEngineNotifier();
});
