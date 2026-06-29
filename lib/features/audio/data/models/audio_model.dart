import '../../domain/entities/audio_entity.dart';

/// Data model representing Audio mapping to/from offline storage (SQLite).
class AudioModel extends AudioEntity {
  const AudioModel({
    required super.id,
  });

  /// Map representation to insert into SQLite database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  /// Create model from database map
  factory AudioModel.fromMap(Map<String, dynamic> map) {
    return AudioModel(
      id: map['id'] as String,
    );
  }
}
