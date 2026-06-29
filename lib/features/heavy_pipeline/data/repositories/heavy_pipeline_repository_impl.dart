import '../../domain/entities/heavy_pipeline_entity.dart';
import '../../domain/repositories/heavy_pipeline_repository.dart';
import '../datasources/heavy_pipeline_local_datasource.dart';

/// Implementation of the [HeavyPipelineRepository] interface.
class HeavyPipelineRepositoryImpl implements HeavyPipelineRepository {
  final HeavyPipelineLocalDataSource localDataSource;

  const HeavyPipelineRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<HeavyPipelineEntity> getHeavyPipelineData(String id) async {
    return await localDataSource.getOfflineData(id);
  }
}
