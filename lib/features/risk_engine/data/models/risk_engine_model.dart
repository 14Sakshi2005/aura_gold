import '../../domain/entities/risk_engine_entity.dart';

/// Data model representing RiskEngine mapping to/from offline storage (SQLite).
class RiskEngineModel extends RiskEngineEntity {
  const RiskEngineModel({
    required super.id,
  });

  /// Map representation to insert into SQLite database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  /// Create model from database map
  factory RiskEngineModel.fromMap(Map<String, dynamic> map) {
    return RiskEngineModel(
      id: map['id'] as String,
    );
  }
}
