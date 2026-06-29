import '../../domain/entities/risk_engine_entity.dart';
import '../../domain/repositories/risk_engine_repository.dart';
import '../datasources/risk_engine_local_datasource.dart';

/// Implementation of the [RiskEngineRepository] interface.
class RiskEngineRepositoryImpl implements RiskEngineRepository {
  final RiskEngineLocalDataSource localDataSource;

  const RiskEngineRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<RiskEngineEntity> getRiskEngineData(String id) async {
    return await localDataSource.getOfflineData(id);
  }
}
