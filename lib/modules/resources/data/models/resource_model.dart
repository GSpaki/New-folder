import '../../domain/entities/resource_entity.dart';

class ResourceModel extends ResourceEntity {
  ResourceModel(
      {required super.createdDate,
      required super.updatedDate,
      required super.resourceId,
      required super.moduleId,
      required super.languageId,
      required super.value});

  factory ResourceModel.fromEntity(ResourceEntity entity) {
    return ResourceModel(
      createdDate: entity.createdDate,
      updatedDate: entity.updatedDate,
      resourceId: entity.resourceId,
      moduleId: entity.moduleId,
      languageId: entity.languageId,
      value: entity.value,
    );
  }
}
