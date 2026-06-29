import '../entities/heavy_pipeline_entity.dart';
import '../repositories/heavy_pipeline_repository.dart';
import '../../../../core/usecase/usecase.dart';

/// UseCase to retrieve HeavyPipeline.
class GetHeavyPipelineUseCase implements UseCase<HeavyPipelineEntity, String> {
  final HeavyPipelineRepository repository;

  const GetHeavyPipelineUseCase(this.repository);

  @override
  Future<HeavyPipelineEntity> call(String params) async {
    return await repository.getHeavyPipelineData(params);
  }
}
