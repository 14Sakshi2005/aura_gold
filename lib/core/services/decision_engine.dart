import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Class containing the output of the [DecisionEngine] evaluation.
class DecisionResult {
  final String route;
  final String status;

  const DecisionResult({
    required this.route,
    required this.status,
  });
}

/// Service that evaluates asset properties (e.g. weight) and determines
/// pipeline routing and workflow status offline.
class DecisionEngine {
  const DecisionEngine();

  /// Evaluate the asset weight to route it to the appropriate testing pipeline
  DecisionResult evaluate(double weight) {
    if (weight >= 5.0) {
      return const DecisionResult(
        route: '/heavy-pipeline',
        status: 'HeavyPipeline',
      );
    } else {
      return const DecisionResult(
        route: '/lightweight-pipeline',
        status: 'LightweightPipeline',
      );
    }
  }
}

/// Riverpod Provider to inject DecisionEngine instance
final decisionEngineProvider = Provider<DecisionEngine>((ref) {
  return const DecisionEngine();
});
