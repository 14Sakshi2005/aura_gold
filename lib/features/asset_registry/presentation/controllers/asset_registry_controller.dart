import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/database_service.dart';
import '../../../../core/services/decision_engine.dart';
import '../../../audit_log/presentation/controllers/audit_log_controller.dart';
import '../../data/datasources/asset_registry_local_datasource.dart';
import '../../data/repositories/asset_registry_repository_impl.dart';
import '../../domain/entities/asset_registry_entity.dart';
import '../../domain/repositories/asset_registry_repository.dart';
import '../../domain/usecases/get_assets_usecase.dart';
import '../../domain/usecases/register_asset_usecase.dart';
import '../../domain/usecases/update_asset_status_usecase.dart';

// 1. Dependency Injection Providers
final assetLocalDataSourceProvider = Provider<AssetLocalDataSource>((ref) {
  return AssetLocalDataSource(DatabaseService.instance);
});

final assetRepositoryProvider = Provider<AssetRepository>((ref) {
  final dataSource = ref.watch(assetLocalDataSourceProvider);
  final auditLogRepo = ref.watch(auditLogRepositoryProvider);
  return AssetRepositoryImpl(
    localDataSource: dataSource,
    auditLogRepository: auditLogRepo,
  );
});

final registerAssetUseCaseProvider = Provider<RegisterAssetUseCase>((ref) {
  final repository = ref.watch(assetRepositoryProvider);
  return RegisterAssetUseCase(repository);
});

final getAssetsUseCaseProvider = Provider<GetAssetsUseCase>((ref) {
  final repository = ref.watch(assetRepositoryProvider);
  return GetAssetsUseCase(repository);
});

final updateAssetStatusUseCaseProvider = Provider<UpdateAssetStatusUseCase>((ref) {
  final repository = ref.watch(assetRepositoryProvider);
  return UpdateAssetStatusUseCase(repository);
});

// 2. State & Controller for Form Registration
class AssetFormState {
  final String name;
  final String category;
  final double weight;
  final String karat;
  final String notes;
  final bool isLoading;
  final bool success;
  final String? errorMessage;

  const AssetFormState({
    this.name = '',
    this.category = 'Ring',
    this.weight = 0.0,
    this.karat = '18K',
    this.notes = '',
    this.isLoading = false,
    this.success = false,
    this.errorMessage,
  });

  AssetFormState copyWith({
    String? name,
    String? category,
    double? weight,
    String? karat,
    String? notes,
    bool? isLoading,
    bool? success,
    String? errorMessage,
  }) {
    return AssetFormState(
      name: name ?? this.name,
      category: category ?? this.category,
      weight: weight ?? this.weight,
      karat: karat ?? this.karat,
      notes: notes ?? this.notes,
      isLoading: isLoading ?? this.isLoading,
      success: success ?? this.success,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class AssetFormNotifier extends StateNotifier<AssetFormState> {
  final RegisterAssetUseCase _registerAsset;
  final UpdateAssetStatusUseCase _updateAssetStatus;
  final DecisionEngine _decisionEngine;

  AssetFormNotifier({
    required RegisterAssetUseCase registerAsset,
    required UpdateAssetStatusUseCase updateAssetStatus,
    required DecisionEngine decisionEngine,
  })  : _registerAsset = registerAsset,
        _updateAssetStatus = updateAssetStatus,
        _decisionEngine = decisionEngine,
        super(const AssetFormState());

  void updateName(String name) => state = state.copyWith(name: name);
  void updateCategory(String category) => state = state.copyWith(category: category);
  void updateWeight(double weight) => state = state.copyWith(weight: weight);
  void updateKarat(String karat) => state = state.copyWith(karat: karat);
  void updateNotes(String notes) => state = state.copyWith(notes: notes);

  /// Submit the registration form, evaluate the weight via DecisionEngine,
  /// update the pipeline status, and return routing results.
  Future<DecisionResult?> submitForm() async {
    if (state.name.trim().isEmpty) {
      state = state.copyWith(errorMessage: 'Asset Name cannot be empty');
      return null;
    }
    if (state.weight <= 0) {
      state = state.copyWith(errorMessage: 'Weight must be greater than 0');
      return null;
    }

    state = state.copyWith(isLoading: true, success: false, errorMessage: null);

    try {
      final id = const Uuid().v4();
      final now = DateTime.now().millisecondsSinceEpoch;

      final entity = AssetEntity(
        id: id,
        name: state.name.trim(),
        category: state.category,
        weight: state.weight,
        karat: state.karat,
        notes: state.notes.trim(),
        status: 'Pending',
        createdAt: now,
        updatedAt: now,
      );

      // Step 1: Register initial asset details into db (Triggers CREATE_ASSET audit log)
      await _registerAsset(entity);

      // Step 2: Run offline decision evaluations based on weight
      final result = _decisionEngine.evaluate(state.weight);

      // Step 3: Transition pipeline status (Triggers TRANSITION_STATUS audit log)
      await _updateAssetStatus(UpdateAssetStatusParams(
        id: id,
        status: result.status,
      ));

      state = state.copyWith(isLoading: false, success: true);
      return result;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Registration failed: $e',
      );
      return null;
    }
  }

  void reset() {
    state = const AssetFormState();
  }
}

final assetFormControllerProvider =
    StateNotifierProvider.autoDispose<AssetFormNotifier, AssetFormState>((ref) {
  final registerUseCase = ref.watch(registerAssetUseCaseProvider);
  final statusUseCase = ref.watch(updateAssetStatusUseCaseProvider);
  final decisionEngine = ref.watch(decisionEngineProvider);

  return AssetFormNotifier(
    registerAsset: registerUseCase,
    updateAssetStatus: statusUseCase,
    decisionEngine: decisionEngine,
  );
});
