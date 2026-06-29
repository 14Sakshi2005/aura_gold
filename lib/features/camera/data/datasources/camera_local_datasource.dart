import '../models/camera_model.dart';
import '../../../../core/database/database_service.dart';

/// Offline data source for Camera feature.
class CameraLocalDataSource {
  final DatabaseService _dbService;

  const CameraLocalDataSource(this._dbService);

  Future<CameraModel> getOfflineData(String id) async {
    final db = await _dbService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'camera_table',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) {
      throw Exception('Data not found for id $id');
    }

    return CameraModel.fromMap(maps.first);
  }
}
