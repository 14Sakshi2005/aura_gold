import '../../../../core/database/database_service.dart';
import '../models/asset_registry_model.dart';

/// Database provider for offline assets management.
class AssetLocalDataSource {
  final DatabaseService _dbService;

  const AssetLocalDataSource(this._dbService);

  /// Insert a new asset
  Future<void> insertAsset(AssetModel asset) async {
    final db = await _dbService.database;
    await db.insert(
      'assets',
      asset.toMap(),
    );
  }

  /// Update an asset's state
  Future<void> updateAssetStatus(String id, String status, int updatedAt) async {
    final db = await _dbService.database;
    await db.update(
      'assets',
      {
        'status': status,
        'updated_at': updatedAt,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Retrieve all registered assets
  Future<List<AssetModel>> getAllAssets() async {
    final db = await _dbService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'assets',
      orderBy: 'created_at DESC',
    );
    return maps.map((map) => AssetModel.fromMap(map)).toList();
  }

  /// Query single asset by id
  Future<AssetModel?> getAssetById(String id) async {
    final db = await _dbService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'assets',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) return null;
    return AssetModel.fromMap(maps.first);
  }
}
