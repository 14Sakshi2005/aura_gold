import '../../domain/entities/feature_fusion_entity.dart';
import '../../domain/repositories/feature_fusion_repository.dart';
import '../datasources/feature_fusion_local_datasource.dart';

/// Implementation of the [FeatureFusionRepository] interface.
class FeatureFusionRepositoryImpl implements FeatureFusionRepository {
  final FeatureFusionLocalDataSource localDataSource;

  const FeatureFusionRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<FeatureFusionEntity> getFeatureFusionData(String id) async {
    return await localDataSource.getOfflineData(id);
  }
}
