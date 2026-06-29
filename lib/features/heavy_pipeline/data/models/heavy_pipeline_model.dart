import '../../domain/entities/heavy_pipeline_entity.dart';

/// Data model representing HeavyPipeline mapping to/from offline storage (SQLite).
class HeavyPipelineModel extends HeavyPipelineEntity {
  const HeavyPipelineModel({
    required super.id,
  });

  /// Map representation to insert into SQLite database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  /// Create model from database map
  factory HeavyPipelineModel.fromMap(Map<String, dynamic> map) {
    return HeavyPipelineModel(
      id: map['id'] as String,
    );
  }
}
