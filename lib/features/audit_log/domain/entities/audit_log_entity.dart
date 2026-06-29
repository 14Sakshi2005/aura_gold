/// Domain entity representing a system audit log record.
class AuditLogEntity {
  final String id;
  final String assetId;
  final int timestamp;
  final String action;
  final String details;

  const AuditLogEntity({
    required this.id,
    required this.assetId,
    required this.timestamp,
    required this.action,
    required this.details,
  });
}
