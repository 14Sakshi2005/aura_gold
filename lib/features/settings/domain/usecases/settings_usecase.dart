import '../entities/settings_entity.dart';
import '../repositories/settings_repository.dart';
import '../../../../core/usecase/usecase.dart';

/// UseCase to retrieve Settings.
class GetSettingsUseCase implements UseCase<SettingsEntity, String> {
  final SettingsRepository repository;

  const GetSettingsUseCase(this.repository);

  @override
  Future<SettingsEntity> call(String params) async {
    return await repository.getSettingsData(params);
  }
}
