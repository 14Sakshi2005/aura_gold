import '../models/heavy_pipeline_model.dart';
import '../../../../core/database/database_service.dart';

/// Offline data source for HeavyPipeline feature.
class HeavyPipelineLocalDataSource {
  final DatabaseService _dbService;

  const HeavyPipelineLocalDataSource(this._dbService);

  Future<HeavyPipelineModel> getOfflineData(String id) async {
    final db = await _dbService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'heavy_pipeline_table',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) {
      throw Exception('Data not found for id $id');
    }

    return HeavyPipelineModel.fromMap(maps.first);
  }
}
