import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project/modules/resources/data/i_repositories/i_repository.dart';
import 'package:project/modules/resources/data/models/resource_model.dart';
import 'package:project/modules/resources/infra/i_datasources/i_datasource.dart';
import 'package:project/modules/resources/infra/repositories/resource_online_repository.dart';
import 'package:project/modules/shared/failures/datasource_failure.dart';
import 'package:project/modules/shared/failures/i_failure.dart';
import 'package:project/modules/shared/failures/repository_failure.dart';

import '../../mock/mock_resource_response.dart';

class MockDatasource extends Mock implements IDatasource {}

void main() {
  late IRepository repository;
  late IDatasource datasource;
  setUp(() {
    datasource = MockDatasource();
    repository = ResourceOnlineRepository(datasource);
  });
  test(
    "Repository should return a list of models when called successefully",
    () async {
      //arrange
      when(() => datasource.getAll()).thenAnswer((_) async => mockResourceResponse);

      //act
      final actual = await repository.getAllResources();

      //assert
      expect(actual, isA<List<ResourceModel>>());
    },
  );

  test(
    "Repository should throw a datasource failure when called unsuccessefully",
    () async {
      //arrange
      when(() => datasource.getAll()).thenThrow(Exception());

      //act
      final actual = repository.getAllResources();

      //assert
      expect(actual, throwsA(isA<DatasourceFailure>()));
    },
  );

  test(
    "Repository should throw a reposiroty failure when missmatch on mapper",
    () async {
      //arrange
      when(() => datasource.getAll()).thenAnswer((_) async => [
            {
              'wrong': {'wrong': 'wrong'}
            }
          ]);

      //act
      final actual = repository.getAllResources();

      //assert
      expect(actual, throwsA(isA<RepositoryFailure>()));
    },
  );
}
