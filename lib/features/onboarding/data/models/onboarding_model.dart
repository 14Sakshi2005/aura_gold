import '../../domain/entities/onboarding_entity.dart';

/// Data model representing Onboarding mapping to/from offline storage (SQLite).
class OnboardingModel extends OnboardingEntity {
  const OnboardingModel({
    required super.id,
  });

  /// Map representation to insert into SQLite database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  /// Create model from database map
  factory OnboardingModel.fromMap(Map<String, dynamic> map) {
    return OnboardingModel(
      id: map['id'] as String,
    );
  }
}
