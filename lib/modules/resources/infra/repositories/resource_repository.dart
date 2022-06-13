import '../../data/i_repositories/i_repository.dart';
import '../../data/models/resource_model.dart';
import '../i_datasources/i_datasource.dart';
import '../../../shared/failures/datasource_failure.dart';

class ResourceRepository implements IRepository {
  final IDatasource _datasource;

  ResourceRepository(this._datasource);

  ResourceModel _modelFromMap(Map map) {
    String? creatadeDate = map['resource']['created_at'];
    String? updatedDate = map['resource']['updated_at'];
    String resourceId = map['resource']['resource_id'];
    String moduleId = map['resource']['module_id'];
    String languageId = map['resource']['language_id'];
    String value = map['resource']['value'];

    return ResourceModel(
      createdDate: (creatadeDate != null) ? DateTime.parse(creatadeDate) : null,
      updatedDate: (updatedDate != null) ? DateTime.parse(updatedDate) : null,
      resourceId: resourceId,
      moduleId: moduleId,
      languageId: languageId,
      value: value,
    );
  }

  @override
  Future<List<ResourceModel>> getAllResources() async {
    final List<dynamic> response;
    final List<ResourceModel> result;
    try {
      response = await _datasource.getAll();
    } on Exception {
      throw DatasourceFailure();
    }

    // try {
    result = response
        .map(
          (e) => _modelFromMap(e),
        )
        .toList();
    return result;
    // } on Error catch (e) {
    //   print(e);
    //   throw RepositoryFailure();
    // }
  }
}
