import '../models/onboarding_model.dart';
import '../../../../core/database/database_service.dart';

/// Offline data source for Onboarding feature.
class OnboardingLocalDataSource {
  final DatabaseService _dbService;

  const OnboardingLocalDataSource(this._dbService);

  Future<OnboardingModel> getOfflineData(String id) async {
    final db = await _dbService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'onboarding_table',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) {
      throw Exception('Data not found for id $id');
    }

    return OnboardingModel.fromMap(maps.first);
  }
}
