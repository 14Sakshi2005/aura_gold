import '../entities/lightweight_pipeline_entity.dart';

/// Repository interface for LightweightPipeline feature.
abstract class LightweightPipelineRepository {
  Future<LightweightPipelineEntity> getLightweightPipelineData(String id);
}
