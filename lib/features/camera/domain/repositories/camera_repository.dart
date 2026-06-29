import '../entities/camera_entity.dart';

/// Repository interface for Camera feature.
abstract class CameraRepository {
  Future<CameraEntity> getCameraData(String id);
}
