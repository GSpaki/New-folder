import '../../data/models/resource_model.dart';

abstract class ILocalDatasource {
  Future<List<dynamic>> getAll();

  loadAll(List<ResourceModel> modelsList);
}
