import '../models/risk_engine_model.dart';
import '../../../../core/database/database_service.dart';

/// Offline data source for RiskEngine feature.
class RiskEngineLocalDataSource {
  final DatabaseService _dbService;

  const RiskEngineLocalDataSource(this._dbService);

  Future<RiskEngineModel> getOfflineData(String id) async {
    final db = await _dbService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'risk_engine_table',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) {
      throw Exception('Data not found for id $id');
    }

    return RiskEngineModel.fromMap(maps.first);
  }
}
