import '../entities/risk_engine_entity.dart';
import '../repositories/risk_engine_repository.dart';
import '../../../../core/usecase/usecase.dart';

/// UseCase to retrieve RiskEngine.
class GetRiskEngineUseCase implements UseCase<RiskEngineEntity, String> {
  final RiskEngineRepository repository;

  const GetRiskEngineUseCase(this.repository);

  @override
  Future<RiskEngineEntity> call(String params) async {
    return await repository.getRiskEngineData(params);
  }
}
