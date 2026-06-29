import '../entities/audit_log_entity.dart';

/// Repository interface for managing Audit Logs.
abstract class AuditLogRepository {
  Future<void> logAudit(AuditLogEntity log);
  Future<List<AuditLogEntity>> getLogsForAsset(String assetId);
  Future<List<AuditLogEntity>> getAllLogs();
}
