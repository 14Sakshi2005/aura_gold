/// Domain entity representing a physical asset registered in AURA_Gold.
class AssetEntity {
  final String id;
  final String name;
  final String category;
  final double weight;
  final String karat;
  final String notes;
  final String status; // Pending, HeavyPipeline, LightweightPipeline, Completed, Flagged
  final int createdAt;
  final int updatedAt;

  const AssetEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.weight,
    required this.karat,
    required this.notes,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  AssetEntity copyWith({
    String? id,
    String? name,
    String? category,
    double? weight,
    String? karat,
    String? notes,
    String? status,
    int? createdAt,
    int? updatedAt,
  }) {
    return AssetEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      weight: weight ?? this.weight,
      karat: karat ?? this.karat,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
