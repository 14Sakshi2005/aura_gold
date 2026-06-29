import '../entities/lightweight_pipeline_entity.dart';
import '../repositories/lightweight_pipeline_repository.dart';
import '../../../../core/usecase/usecase.dart';

/// UseCase to retrieve LightweightPipeline.
class GetLightweightPipelineUseCase implements UseCase<LightweightPipelineEntity, String> {
  final LightweightPipelineRepository repository;

  const GetLightweightPipelineUseCase(this.repository);

  @override
  Future<LightweightPipelineEntity> call(String params) async {
    return await repository.getLightweightPipelineData(params);
  }
}
