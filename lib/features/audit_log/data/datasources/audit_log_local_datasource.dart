import '../../../../core/database/database_service.dart';
import '../models/audit_log_model.dart';

/// Database provider for offline audit logs management.
class AuditLogLocalDataSource {
  final DatabaseService _dbService;

  const AuditLogLocalDataSource(this._dbService);

  /// Insert log into database
  Future<void> insertLog(AuditLogModel log) async {
    final db = await _dbService.database;
    await db.insert(
      'audit_logs',
      log.toMap(),
    );
  }

  /// Get logs for a specific asset
  Future<List<AuditLogModel>> getLogsForAsset(String assetId) async {
    final db = await _dbService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'audit_logs',
      where: 'asset_id = ?',
      whereArgs: [assetId],
      orderBy: 'timestamp DESC',
    );
    return maps.map((map) => AuditLogModel.fromMap(map)).toList();
  }

  /// Retrieve all system logs
  Future<List<AuditLogModel>> getAllLogs() async {
    final db = await _dbService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'audit_logs',
      orderBy: 'timestamp DESC',
    );
    return maps.map((map) => AuditLogModel.fromMap(map)).toList();
  }
}
