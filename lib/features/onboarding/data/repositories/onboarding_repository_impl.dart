import '../../domain/entities/onboarding_entity.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/onboarding_local_datasource.dart';

/// Implementation of the [OnboardingRepository] interface.
class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource localDataSource;

  const OnboardingRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<OnboardingEntity> getOnboardingData(String id) async {
    return await localDataSource.getOfflineData(id);
  }
}
