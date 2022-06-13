import 'package:project/modules/resources/domain/i_usecases/i_get_all_resources_usecase.dart';

import '../entities/resource_entity.dart';

abstract class IGetAndStoreAllUsecase extends IGetAllResourcesUsecase {
  storeAll(List<ResourceEntity> entitiesList);
}
