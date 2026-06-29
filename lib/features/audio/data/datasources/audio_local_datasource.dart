import '../models/audio_model.dart';
import '../../../../core/database/database_service.dart';

/// Offline data source for Audio feature.
class AudioLocalDataSource {
  final DatabaseService _dbService;

  const AudioLocalDataSource(this._dbService);

  Future<AudioModel> getOfflineData(String id) async {
    final db = await _dbService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'audio_table',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) {
      throw Exception('Data not found for id $id');
    }

    return AudioModel.fromMap(maps.first);
  }
}
