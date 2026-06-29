import '../../domain/entities/lightweight_pipeline_entity.dart';

/// Data model representing LightweightPipeline mapping to/from offline storage (SQLite).
class LightweightPipelineModel extends LightweightPipelineEntity {
  const LightweightPipelineModel({
    required super.id,
  });

  /// Map representation to insert into SQLite database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  /// Create model from database map
  factory LightweightPipelineModel.fromMap(Map<String, dynamic> map) {
    return LightweightPipelineModel(
      id: map['id'] as String,
    );
  }
}
