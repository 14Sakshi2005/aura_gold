import '../entities/feature_fusion_entity.dart';

/// Repository interface for FeatureFusion feature.
abstract class FeatureFusionRepository {
  Future<FeatureFusionEntity> getFeatureFusionData(String id);
}
