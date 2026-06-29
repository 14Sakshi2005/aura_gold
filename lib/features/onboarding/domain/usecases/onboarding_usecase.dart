import '../entities/onboarding_entity.dart';
import '../repositories/onboarding_repository.dart';
import '../../../../core/usecase/usecase.dart';

/// UseCase to retrieve Onboarding.
class GetOnboardingUseCase implements UseCase<OnboardingEntity, String> {
  final OnboardingRepository repository;

  const GetOnboardingUseCase(this.repository);

  @override
  Future<OnboardingEntity> call(String params) async {
    return await repository.getOnboardingData(params);
  }
}
