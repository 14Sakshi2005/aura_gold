import '../entities/home_entity.dart';

/// Repository interface for Home feature.
abstract class HomeRepository {
  Future<HomeEntity> getHomeData(String id);
}
