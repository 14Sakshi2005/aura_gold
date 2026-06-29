import '../../domain/entities/audit_log_entity.dart';

/// SQLite-compatible data model for audit log records.
class AuditLogModel extends AuditLogEntity {
  const AuditLogModel({
    required super.id,
    required super.assetId,
    required super.timestamp,
    required super.action,
    required super.details,
  });

  /// Map representations to insert into local SQLite tables
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'asset_id': assetId,
      'timestamp': timestamp,
      'action': action,
      'details': details,
    };
  }

  /// Create model from database queries
  factory AuditLogModel.fromMap(Map<String, dynamic> map) {
    return AuditLogModel(
      id: map['id'] as String,
      assetId: map['asset_id'] as String,
      timestamp: map['timestamp'] as int,
      action: map['action'] as String,
      details: map['details'] as String,
    );
  }
}
