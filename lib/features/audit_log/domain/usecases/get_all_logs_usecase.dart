import '../../../../core/usecase/usecase.dart';
import '../entities/audit_log_entity.dart';
import '../repositories/audit_log_repository.dart';

/// Use case for fetching all audit logs across the application.
class GetAllLogsUseCase implements UseCase<List<AuditLogEntity>, NoParams> {
  final AuditLogRepository repository;

  const GetAllLogsUseCase(this.repository);

  @override
  Future<List<AuditLogEntity>> call(NoParams params) async {
    return await repository.getAllLogs();
  }
}
