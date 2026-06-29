import '../../domain/entities/camera_entity.dart';

/// Data model representing Camera mapping to/from offline storage (SQLite).
class CameraModel extends CameraEntity {
  const CameraModel({
    required super.id,
  });

  /// Map representation to insert into SQLite database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  /// Create model from database map
  factory CameraModel.fromMap(Map<String, dynamic> map) {
    return CameraModel(
      id: map['id'] as String,
    );
  }
}
