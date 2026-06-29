import '../entities/settings_entity.dart';

/// Repository interface for Settings feature.
abstract class SettingsRepository {
  Future<SettingsEntity> getSettingsData(String id);
}
