import '../../../../core/usecase/usecase.dart';
import '../entities/audit_log_entity.dart';
import '../repositories/audit_log_repository.dart';

/// Use case for creating a new system audit log.
class LogAuditUseCase implements UseCase<void, AuditLogEntity> {
  final AuditLogRepository repository;

  const LogAuditUseCase(this.repository);

  @override
  Future<void> call(AuditLogEntity log) async {
    return await repository.logAudit(log);
  }
}
