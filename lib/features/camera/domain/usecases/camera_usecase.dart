import '../entities/camera_entity.dart';
import '../repositories/camera_repository.dart';
import '../../../../core/usecase/usecase.dart';

/// UseCase to retrieve Camera.
class GetCameraUseCase implements UseCase<CameraEntity, String> {
  final CameraRepository repository;

  const GetCameraUseCase(this.repository);

  @override
  Future<CameraEntity> call(String params) async {
    return await repository.getCameraData(params);
  }
}
