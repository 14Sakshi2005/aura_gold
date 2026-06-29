import '../../domain/entities/camera_entity.dart';
import '../../domain/repositories/camera_repository.dart';
import '../datasources/camera_local_datasource.dart';

/// Implementation of the [CameraRepository] interface.
class CameraRepositoryImpl implements CameraRepository {
  final CameraLocalDataSource localDataSource;

  const CameraRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<CameraEntity> getCameraData(String id) async {
    return await localDataSource.getOfflineData(id);
  }
}
