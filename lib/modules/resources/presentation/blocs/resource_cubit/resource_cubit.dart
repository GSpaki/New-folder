import 'package:bloc/bloc.dart';
import '../../../../shared/failures/i_failure.dart';

import '../../../data/models/resource_model.dart';
import '../../../domain/entities/resource_entity.dart';
import '../../../domain/i_usecases/i_get_all_resources_usecase.dart';

part 'resource_state.dart';

class ResourceCubit extends Cubit<ResourceState> {
  final IGetAllResourcesUsecase getAllUsecase;
  ResourceCubit({required this.getAllUsecase}) : super(ResourceInitialState());

  void getResources() async {
    emit(ResourceLoadingState());

    final res = await getAllUsecase();

    res.when(
      ok: (entitiesList) => emit(ResourceLoadedState(entitiesList)),
      err: (failure) => emit(ResourceFailureState(failure)),
    );
  }
}
