import '../../domain/entities/settings_entity.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasources/settings_local_datasource.dart';

/// Implementation of the [SettingsRepository] interface.
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource localDataSource;

  const SettingsRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<SettingsEntity> getSettingsData(String id) async {
    return await localDataSource.getOfflineData(id);
  }
}
