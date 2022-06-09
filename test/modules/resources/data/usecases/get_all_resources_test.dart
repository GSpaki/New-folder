import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project/modules/resources/data/i_repositories/i_repository.dart';
import 'package:project/modules/resources/data/usecases/get_all_resources.dart';
import 'package:project/modules/resources/domain/entities/resource_entity.dart';
import 'package:project/modules/resources/domain/i_usecases/i_get_all_resources_usecase.dart';
import 'package:project/modules/shared/failures/i_failure.dart';
import 'package:project/modules/shared/failures/repository_failure.dart';

import '../../mock/mock_resource_model.dart';

class MockRepository extends Mock implements IRepository {}

void main() {
  late IGetAllResourcesUsecase usecase;
  late IRepository repository;

  setUp(() {
    repository = MockRepository();
    usecase = GetAllResourcesUsecase(repository);
  });
  test(
    "Usecase should return a entity when called successefully",
    () async {
      //arrange
      when(() => repository.getAllResources()).thenAnswer((_) async => [mockResourceModel]);

      //act
      final actual = await usecase();

      //assert
      expect(actual.unwrap(), isA<List<ResourceEntity>>());
    },
  );

  test(
    "Usecase should return a failure when called unsuccessefully",
    () async {
      //arrange
      when(() => repository.getAllResources()).thenThrow(RepositoryFailure());

      //act
      final actual = await usecase();

      //assert
      expect(actual.unwrapErr(), isA<IFailure>());
    },
  );
}
