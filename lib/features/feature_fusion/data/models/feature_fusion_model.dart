import '../../domain/entities/feature_fusion_entity.dart';

/// Data model representing FeatureFusion mapping to/from offline storage (SQLite).
class FeatureFusionModel extends FeatureFusionEntity {
  const FeatureFusionModel({
    required super.id,
  });

  /// Map representation to insert into SQLite database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  /// Create model from database map
  factory FeatureFusionModel.fromMap(Map<String, dynamic> map) {
    return FeatureFusionModel(
      id: map['id'] as String,
    );
  }
}
