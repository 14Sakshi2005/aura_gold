import '../entities/home_entity.dart';
import '../repositories/home_repository.dart';
import '../../../../core/usecase/usecase.dart';

/// UseCase to retrieve Home.
class GetHomeUseCase implements UseCase<HomeEntity, String> {
  final HomeRepository repository;

  const GetHomeUseCase(this.repository);

  @override
  Future<HomeEntity> call(String params) async {
    return await repository.getHomeData(params);
  }
}
