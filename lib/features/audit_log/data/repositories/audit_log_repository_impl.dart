import '../../domain/entities/audit_log_entity.dart';
import '../../domain/repositories/audit_log_repository.dart';
import '../datasources/audit_log_local_datasource.dart';
import '../models/audit_log_model.dart';

/// Repository implementation linking domain and SQLite storage for Audit Logs.
class AuditLogRepositoryImpl implements AuditLogRepository {
  final AuditLogLocalDataSource localDataSource;

  const AuditLogRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<void> logAudit(AuditLogEntity log) async {
    final model = AuditLogModel(
      id: log.id,
      assetId: log.assetId,
      timestamp: log.timestamp,
      action: log.action,
      details: log.details,
    );
    await localDataSource.insertLog(model);
  }

  @override
  Future<List<AuditLogEntity>> getLogsForAsset(String assetId) async {
    return await localDataSource.getLogsForAsset(assetId);
  }

  @override
  Future<List<AuditLogEntity>> getAllLogs() async {
    return await localDataSource.getAllLogs();
  }
}
