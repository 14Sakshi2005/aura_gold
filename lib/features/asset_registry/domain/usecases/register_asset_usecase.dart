import '../../../../core/usecase/usecase.dart';
import '../entities/asset_registry_entity.dart';
import '../repositories/asset_registry_repository.dart';

/// Usecase for registering a new asset in the system database.
class RegisterAssetUseCase implements UseCase<void, AssetEntity> {
  final AssetRepository repository;

  const RegisterAssetUseCase(this.repository);

  @override
  Future<void> call(AssetEntity asset) async {
    return await repository.registerAsset(asset);
  }
}
