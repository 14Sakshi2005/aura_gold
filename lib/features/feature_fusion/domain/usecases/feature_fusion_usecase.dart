import '../entities/feature_fusion_entity.dart';
import '../repositories/feature_fusion_repository.dart';
import '../../../../core/usecase/usecase.dart';

/// UseCase to retrieve FeatureFusion.
class GetFeatureFusionUseCase implements UseCase<FeatureFusionEntity, String> {
  final FeatureFusionRepository repository;

  const GetFeatureFusionUseCase(this.repository);

  @override
  Future<FeatureFusionEntity> call(String params) async {
    return await repository.getFeatureFusionData(params);
  }
}
