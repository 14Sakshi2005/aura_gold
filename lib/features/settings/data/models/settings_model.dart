import '../../domain/entities/settings_entity.dart';

/// Data model representing Settings mapping to/from offline storage (SQLite).
class SettingsModel extends SettingsEntity {
  const SettingsModel({
    required super.id,
  });

  /// Map representation to insert into SQLite database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  /// Create model from database map
  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(
      id: map['id'] as String,
    );
  }
}
