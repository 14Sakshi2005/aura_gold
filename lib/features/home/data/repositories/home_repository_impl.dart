import '../../domain/entities/home_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_datasource.dart';

/// Implementation of the [HomeRepository] interface.
class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource localDataSource;

  const HomeRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<HomeEntity> getHomeData(String id) async {
    return await localDataSource.getOfflineData(id);
  }
}
