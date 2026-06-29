import '../../domain/entities/home_entity.dart';

/// Data model representing Home mapping to/from offline storage (SQLite).
class HomeModel extends HomeEntity {
  const HomeModel({
    required super.id,
  });

  /// Map representation to insert into SQLite database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  /// Create model from database map
  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      id: map['id'] as String,
    );
  }
}
