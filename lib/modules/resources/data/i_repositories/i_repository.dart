import '../models/resource_model.dart';

abstract class IRepository {
  Future<List<ResourceModel>> getAllResources();
}
