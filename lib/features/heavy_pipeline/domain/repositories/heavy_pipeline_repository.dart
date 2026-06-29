import '../entities/heavy_pipeline_entity.dart';

/// Repository interface for HeavyPipeline feature.
abstract class HeavyPipelineRepository {
  Future<HeavyPipelineEntity> getHeavyPipelineData(String id);
}
