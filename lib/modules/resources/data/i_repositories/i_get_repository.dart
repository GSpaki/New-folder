import '../models/resource_model.dart';

abstract class IGetRepository {
  Future<List<ResourceModel>> getAllResources();
}
