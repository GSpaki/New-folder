import 'package:oxidized/src/result.dart';
import 'package:project/modules/resources/data/i_repositories/i_get_and_load_repository%20copy.dart';
import 'package:project/modules/resources/data/models/resource_model.dart';
import 'package:project/modules/resources/domain/i_usecases/i_get_and_store_all_usecase.dart';

import '../../../shared/failures/i_failure.dart';
import '../../domain/entities/resource_entity.dart';
import '../../domain/i_usecases/i_get_all_resources_usecase.dart';
import '../i_repositories/i_get_repository.dart';

class GetAndStoreAllLocalResourcesUsecase implements IGetAndStoreAllUsecase {
  final IGetandLoadRepository repository;

  GetAndStoreAllLocalResourcesUsecase(this.repository);
  @override
  Future<Result<List<ResourceEntity>, IFailure>> getAll() async {
    try {
      final result = await repository.getAllResources();
      return Result.ok(result);
    } on IFailure catch (failure) {
      return Result.err(failure);
    }
  }

  @override
  storeAll(List<ResourceEntity> entitiesList) async {
    //TODO: try catch and failure handle
    await repository.loadAllResources(entitiesList.map((entity) => ResourceModel.fromEntity(entity)).toList());
  }
}
