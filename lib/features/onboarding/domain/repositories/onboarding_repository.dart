import '../entities/onboarding_entity.dart';

/// Repository interface for Onboarding feature.
abstract class OnboardingRepository {
  Future<OnboardingEntity> getOnboardingData(String id);
}
