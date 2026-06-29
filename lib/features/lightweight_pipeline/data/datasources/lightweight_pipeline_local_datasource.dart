import '../models/lightweight_pipeline_model.dart';
import '../../../../core/database/database_service.dart';

/// Offline data source for LightweightPipeline feature.
class LightweightPipelineLocalDataSource {
  final DatabaseService _dbService;

  const LightweightPipelineLocalDataSource(this._dbService);

  Future<LightweightPipelineModel> getOfflineData(String id) async {
    final db = await _dbService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'lightweight_pipeline_table',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) {
      throw Exception('Data not found for id $id');
    }

    return LightweightPipelineModel.fromMap(maps.first);
  }
}
