import 'package:oxidized/oxidized.dart';

import '../../../shared/failures/i_failure.dart';
import '../entities/resource_entity.dart';

abstract class IGetAllResourcesUsecase {
  Future<Result<List<ResourceEntity>, IFailure>> get();
}
