import '../models/settings_model.dart';
import '../../../../core/database/database_service.dart';

/// Offline data source for Settings feature.
class SettingsLocalDataSource {
  final DatabaseService _dbService;

  const SettingsLocalDataSource(this._dbService);

  Future<SettingsModel> getOfflineData(String id) async {
    final db = await _dbService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'settings_table',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) {
      throw Exception('Data not found for id $id');
    }

    return SettingsModel.fromMap(maps.first);
  }
}
