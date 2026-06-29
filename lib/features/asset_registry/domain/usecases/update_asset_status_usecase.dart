import '../../../../core/usecase/usecase.dart';
import '../repositories/asset_registry_repository.dart';

/// Params class for status update usecase.
class UpdateAssetStatusParams {
  final String id;
  final String status;

  const UpdateAssetStatusParams({
    required this.id,
    required this.status,
  });
}

/// Usecase to transition asset status state.
class UpdateAssetStatusUseCase implements UseCase<void, UpdateAssetStatusParams> {
  final AssetRepository repository;

  const UpdateAssetStatusUseCase(this.repository);

  @override
  Future<void> call(UpdateAssetStatusParams params) async {
    return await repository.updateAssetStatus(params.id, params.status);
  }
}
