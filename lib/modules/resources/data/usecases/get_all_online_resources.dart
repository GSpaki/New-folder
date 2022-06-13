import 'package:oxidized/src/result.dart';

import '../../../shared/failures/i_failure.dart';
import '../../domain/entities/resource_entity.dart';
import '../../domain/i_usecases/i_get_all_resources_usecase.dart';
import '../i_repositories/i_get_repository.dart';

class GetAllOnlineResourcesUsecase implements IGetAllResourcesUsecase {
  final IGetRepository repository;

  GetAllOnlineResourcesUsecase(this.repository);
  @override
  Future<Result<List<ResourceEntity>, IFailure>> getAll() async {
    try {
      final result = await repository.getAllResources();
      return Result.ok(result);
    } on IFailure catch (failure) {
      return Result.err(failure);
    }
  }
}
