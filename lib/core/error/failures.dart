/// Base Failure class representing business logic/domain failures.
abstract class Failure {
  final String message;
  const Failure(this.message);

  @override
  String toString() => message;
}

/// Failure representing SQLite / local storage errors.
class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}

/// Failure representing hardware/sensor access issues (camera/microphone).
class SensorFailure extends Failure {
  const SensorFailure(super.message);
}

/// Failure representing computation or data pipeline errors.
class PipelineFailure extends Failure {
  const PipelineFailure(super.message);
}

/// General fallback failure.
class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'An unknown error occurred.']);
}
