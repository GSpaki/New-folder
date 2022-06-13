class ResourceEntity {
  final DateTime? createdDate;
  final DateTime? updatedDate;
  final String resourceId;
  final String moduleId;
  final String languageId;
  final String value;

  ResourceEntity({
    required this.createdDate,
    required this.updatedDate,
    required this.resourceId,
    required this.moduleId,
    required this.languageId,
    required this.value,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResourceEntity &&
        other.createdDate == createdDate &&
        other.updatedDate == updatedDate &&
        other.resourceId == resourceId &&
        other.moduleId == moduleId &&
        other.languageId == languageId &&
        other.value == value;
  }

  @override
  int get hashCode {
    return createdDate.hashCode ^
        updatedDate.hashCode ^
        resourceId.hashCode ^
        moduleId.hashCode ^
        languageId.hashCode ^
        value.hashCode;
  }
}
