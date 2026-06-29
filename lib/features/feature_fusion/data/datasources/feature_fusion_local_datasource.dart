import '../models/feature_fusion_model.dart';
import '../../../../core/database/database_service.dart';

/// Offline data source for FeatureFusion feature.
class FeatureFusionLocalDataSource {
  final DatabaseService _dbService;

  const FeatureFusionLocalDataSource(this._dbService);

  Future<FeatureFusionModel> getOfflineData(String id) async {
    final db = await _dbService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'feature_fusion_table',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) {
      throw Exception('Data not found for id $id');
    }

    return FeatureFusionModel.fromMap(maps.first);
  }
}
