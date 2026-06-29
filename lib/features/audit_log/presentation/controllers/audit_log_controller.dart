import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/database_service.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/datasources/audit_log_local_datasource.dart';
import '../../data/repositories/audit_log_repository_impl.dart';
import '../../domain/entities/audit_log_entity.dart';
import '../../domain/repositories/audit_log_repository.dart';
import '../../domain/usecases/get_all_logs_usecase.dart';
import '../../domain/usecases/log_audit_usecase.dart';

// 1. Dependency Injection Providers
final auditLogLocalDataSourceProvider = Provider<AuditLogLocalDataSource>((ref) {
  return AuditLogLocalDataSource(DatabaseService.instance);
});

final auditLogRepositoryProvider = Provider<AuditLogRepository>((ref) {
  final dataSource = ref.watch(auditLogLocalDataSourceProvider);
  return AuditLogRepositoryImpl(localDataSource: dataSource);
});

final getAllLogsUseCaseProvider = Provider<GetAllLogsUseCase>((ref) {
  final repository = ref.watch(auditLogRepositoryProvider);
  return GetAllLogsUseCase(repository);
});

final logAuditUseCaseProvider = Provider<LogAuditUseCase>((ref) {
  final repository = ref.watch(auditLogRepositoryProvider);
  return LogAuditUseCase(repository);
});

// 2. Presentation State and Controller
class AuditLogState {
  final bool isLoading;
  final List<AuditLogEntity> logs;
  final String? errorMessage;

  const AuditLogState({
    this.isLoading = false,
    this.logs = const [],
    this.errorMessage,
  });

  AuditLogState copyWith({
    bool? isLoading,
    List<AuditLogEntity>? logs,
    String? errorMessage,
  }) {
    return AuditLogState(
      isLoading: isLoading ?? this.isLoading,
      logs: logs ?? this.logs,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class AuditLogNotifier extends StateNotifier<AuditLogState> {
  final GetAllLogsUseCase _getAllLogsUseCase;

  AuditLogNotifier(this._getAllLogsUseCase) : super(const AuditLogState()) {
    loadLogs();
  }

  Future<void> loadLogs() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final logs = await _getAllLogsUseCase(const NoParams());
      state = state.copyWith(isLoading: false, logs: logs);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load offline audit logs: $e',
      );
    }
  }
}

final auditLogControllerProvider =
    StateNotifierProvider<AuditLogNotifier, AuditLogState>((ref) {
  final getAllLogs = ref.watch(getAllLogsUseCaseProvider);
  return AuditLogNotifier(getAllLogs);
});
