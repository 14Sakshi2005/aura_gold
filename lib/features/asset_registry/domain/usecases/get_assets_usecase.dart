import '../../../../core/usecase/usecase.dart';
import '../entities/asset_registry_entity.dart';
import '../repositories/asset_registry_repository.dart';

/// Usecase to retrieve all registered assets from database.
class GetAssetsUseCase implements UseCase<List<AssetEntity>, NoParams> {
  final AssetRepository repository;

  const GetAssetsUseCase(this.repository);

  @override
  Future<List<AssetEntity>> call(NoParams params) async {
    return await repository.getAllAssets();
  }
}
