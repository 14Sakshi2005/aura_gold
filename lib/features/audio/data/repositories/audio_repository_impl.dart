import '../../domain/entities/audio_entity.dart';
import '../../domain/repositories/audio_repository.dart';
import '../datasources/audio_local_datasource.dart';

/// Implementation of the [AudioRepository] interface.
class AudioRepositoryImpl implements AudioRepository {
  final AudioLocalDataSource localDataSource;

  const AudioRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<AudioEntity> getAudioData(String id) async {
    return await localDataSource.getOfflineData(id);
  }
}
