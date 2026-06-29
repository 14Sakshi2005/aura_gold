import '../../domain/entities/lightweight_pipeline_entity.dart';
import '../../domain/repositories/lightweight_pipeline_repository.dart';
import '../datasources/lightweight_pipeline_local_datasource.dart';

/// Implementation of the [LightweightPipelineRepository] interface.
class LightweightPipelineRepositoryImpl implements LightweightPipelineRepository {
  final LightweightPipelineLocalDataSource localDataSource;

  const LightweightPipelineRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<LightweightPipelineEntity> getLightweightPipelineData(String id) async {
    return await localDataSource.getOfflineData(id);
  }
}
