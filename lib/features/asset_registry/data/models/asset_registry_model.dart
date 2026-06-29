import '../../domain/entities/asset_registry_entity.dart';

/// Database representation model for physical assets.
class AssetModel extends AssetEntity {
  const AssetModel({
    required super.id,
    required super.name,
    required super.category,
    required super.weight,
    required super.karat,
    required super.notes,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
  });

  /// Map representations to insert into local SQLite tables
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'weight': weight,
      'karat': karat,
      'notes': notes,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  /// Create model from database queries
  factory AssetModel.fromMap(Map<String, dynamic> map) {
    return AssetModel(
      id: map['id'] as String,
      name: map['name'] as String,
      category: map['category'] as String,
      weight: map['weight'] as double,
      karat: map['karat'] as String,
      notes: map['notes'] as String,
      status: map['status'] as String,
      createdAt: map['created_at'] as int,
      updatedAt: map['updated_at'] as int,
    );
  }

  /// Factory helper to build from entity
  factory AssetModel.fromEntity(AssetEntity entity) {
    return AssetModel(
      id: entity.id,
      name: entity.name,
      category: entity.category,
      weight: entity.weight,
      karat: entity.karat,
      notes: entity.notes,
      status: entity.status,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
