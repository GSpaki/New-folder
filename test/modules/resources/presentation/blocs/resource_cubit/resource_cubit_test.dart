import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project/modules/resources/domain/i_usecases/i_get_all_resources_usecase.dart';
import 'package:project/modules/resources/presentation/blocs/resource_cubit/resource_cubit.dart';
import 'package:project/modules/shared/failures/repository_failure.dart';

import '../../../mock/mock_resource_model.dart';

class MockGetAllResourcesUsecase extends Mock implements IGetAllResourcesUsecase {}

void main() {
  late ResourceCubit cubit;
  late IGetAllResourcesUsecase usecase;

  setUp(() {
    usecase = MockGetAllResourcesUsecase();
    cubit = ResourceCubit(getAllUsecase: usecase);
  });
  test(
    "Resource cubit should emit a loading state then a loaded state when usecase returns a list of entities",
    () async {
      //arrange
      when(() => usecase.getAll()).thenAnswer((_) async => Result.ok([mockResourceModel]));

      //assert
      expectLater(cubit.stream, emitsInOrder([isA<ResourceLoadingState>(), isA<ResourceLoadedState>()]));

      //act
      cubit.getResources();
    },
  );

  test(
    "Resource cubit should emit a loading state then a failure state when usecase returns failure",
    () async {
      //arrange
      when(() => usecase.getAll()).thenAnswer((_) async => Result.err(RepositoryFailure()));

      //assert
      expectLater(cubit.stream, emitsInOrder([isA<ResourceLoadingState>(), isA<ResourceFailureState>()]));

      //act
      cubit.getResources();
    },
  );
}
