import '../entities/audio_entity.dart';

/// Repository interface for Audio feature.
abstract class AudioRepository {
  Future<AudioEntity> getAudioData(String id);
}
