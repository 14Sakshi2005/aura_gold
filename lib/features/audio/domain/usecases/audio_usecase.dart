import '../entities/audio_entity.dart';
import '../repositories/audio_repository.dart';
import '../../../../core/usecase/usecase.dart';

/// UseCase to retrieve Audio.
class GetAudioUseCase implements UseCase<AudioEntity, String> {
  final AudioRepository repository;

  const GetAudioUseCase(this.repository);

  @override
  Future<AudioEntity> call(String params) async {
    return await repository.getAudioData(params);
  }
}
