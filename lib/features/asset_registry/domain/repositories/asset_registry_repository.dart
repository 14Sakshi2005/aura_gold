import '../entities/asset_registry_entity.dart';

/// Repository interface contract for managing Assets.
abstract class AssetRepository {
  Future<void> registerAsset(AssetEntity asset);
  Future<void> updateAssetStatus(String id, String status);
  Future<List<AssetEntity>> getAllAssets();
  Future<AssetEntity?> getAssetById(String id);
}
