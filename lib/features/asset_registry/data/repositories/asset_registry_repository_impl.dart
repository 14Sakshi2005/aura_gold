import 'package:uuid/uuid.dart';
import '../../domain/entities/asset_registry_entity.dart';
import '../../domain/repositories/asset_registry_repository.dart';
import '../datasources/asset_registry_local_datasource.dart';
import '../models/asset_registry_model.dart';
import '../../../audit_log/domain/entities/audit_log_entity.dart';
import '../../../audit_log/domain/repositories/audit_log_repository.dart';

/// Repository implementation managing Assets and their automated auditing.
class AssetRepositoryImpl implements AssetRepository {
  final AssetLocalDataSource localDataSource;
  final AuditLogRepository auditLogRepository;
  final _uuid = const Uuid();

  const AssetRepositoryImpl({
    required this.localDataSource,
    required this.auditLogRepository,
  });

  @override
  Future<void> registerAsset(AssetEntity asset) async {
    final model = AssetModel.fromEntity(asset);
    await localDataSource.insertAsset(model);

    // Automatically create AuditLog entry on register
    final now = DateTime.now().millisecondsSinceEpoch;
    final log = AuditLogEntity(
      id: _uuid.v4(),
      assetId: asset.id,
      timestamp: now,
      action: 'CREATE_ASSET',
      details: 'Asset "${asset.name}" (${asset.category}) registered. Declared: ${asset.weight}g, ${asset.karat}. Initial Status: ${asset.status}.',
    );
    await auditLogRepository.logAudit(log);
  }

  @override
  Future<void> updateAssetStatus(String id, String status) async {
    final existing = await localDataSource.getAssetById(id);
    if (existing == null) return;

    final oldStatus = existing.status;
    final now = DateTime.now().millisecondsSinceEpoch;

    await localDataSource.updateAssetStatus(id, status, now);

    // Automatically create AuditLog entry on pipeline transition
    final log = AuditLogEntity(
      id: _uuid.v4(),
      assetId: id,
      timestamp: now,
      action: 'TRANSITION_STATUS',
      details: 'Pipeline state shifted from "$oldStatus" to "$status".',
    );
    await auditLogRepository.logAudit(log);
  }

  @override
  Future<List<AssetEntity>> getAllAssets() async {
    return await localDataSource.getAllAssets();
  }

  @override
  Future<AssetEntity?> getAssetById(String id) async {
    return await localDataSource.getAssetById(id);
  }
}
