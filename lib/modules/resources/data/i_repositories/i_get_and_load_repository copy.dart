import 'package:project/modules/resources/data/i_repositories/i_get_repository.dart';

import '../models/resource_model.dart';

abstract class IGetandLoadRepository extends IGetRepository {
  loadAllResources(List<ResourceModel> modelsList);
}
