import '../entities/risk_engine_entity.dart';

/// Repository interface for RiskEngine feature.
abstract class RiskEngineRepository {
  Future<RiskEngineEntity> getRiskEngineData(String id);
}
