import 'package:project/modules/resources/data/i_repositories/i_repository.dart';
import 'package:project/modules/resources/data/models/resource_model.dart';
import 'package:project/modules/resources/infra/i_datasources/i_datasource.dart';
import 'package:project/modules/shared/failures/datasource_failure.dart';
import 'package:project/modules/shared/failures/repository_failure.dart';

class ResourceRepository implements IRepository {
  final IDatasource _datasource;

  ResourceRepository(this._datasource);

  ResourceModel _modelFromMap(Map<String, String> map) {
    return ResourceModel(
      createdDate: DateTime.parse(map['created_at']!),
      updatedDate: DateTime.parse(map['updated_at']!),
      resourceId: map['resource_id']!,
      moduleId: map['module_id']!,
      languageId: map['language_id']!,
      value: map['value']!,
    );
  }

  @override
  Future<List<ResourceModel>> getAllResources() async {
    final List<Map<String, Map<String, String>>> response;
    final List<ResourceModel> result;
    try {
      response = await _datasource.getAll();
    } on Exception {
      throw DatasourceFailure();
    }

    try {
      result = response
          .expand(
            (resources) => resources.values.map(
              (resource) => _modelFromMap(resource),
            ),
          )
          .toList();
      return result;
    } on Error {
      throw RepositoryFailure();
    }
  }
}
