import 'package:project/modules/resources/data/models/resource_model.dart';

abstract class IRepository {
  Future<List<ResourceModel>> getAllResources();
}
