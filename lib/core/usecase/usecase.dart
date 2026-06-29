/// Base class for all clean architecture use cases.
///
/// [T] is the type of data returned on success.
/// [Params] is the input arguments class. Use [NoParams] if no inputs are required.
abstract class UseCase<T, Params> {
  const UseCase();

  /// Executes the usecase logic and returns the result [T].
  Future<T> call(Params params);
}

/// Helper class for use cases that require no parameters.
class NoParams {
  const NoParams();
}
