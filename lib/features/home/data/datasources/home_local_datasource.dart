import '../models/home_model.dart';
import '../../../../core/database/database_service.dart';

/// Offline data source for Home feature.
class HomeLocalDataSource {
  final DatabaseService _dbService;

  const HomeLocalDataSource(this._dbService);

  Future<HomeModel> getOfflineData(String id) async {
    final db = await _dbService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'home_table',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) {
      throw Exception('Data not found for id $id');
    }

    return HomeModel.fromMap(maps.first);
  }
}
