import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project/modules/resources/external/resource_online_datasource.dart';
import 'package:project/modules/resources/infra/i_datasources/i_datasource.dart';

import '../mock/mock_resource_response.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late IDatasource datasource;
  late Dio dio;

  setUp(() {
    dio = MockDio();
    datasource = ResourceOnlineDatasource(dio);
  });

  test(
    "Datasource should return a list of maps when called successefully",
    () async {
      //arrange
      when(() => dio.get<List<dynamic>>(any())).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: ''),
            data: mockResourceResponse,
          ));

      //act
      final actual = await datasource.getAll();

      //assert
      expect(actual, isA<List<dynamic>>());
    },
  );

  test(
    "Datasource should throws a exception if dio error happens",
    () async {
      //arrange
      when(() => dio.get<List<dynamic>>(any())).thenThrow(DioError(requestOptions: RequestOptions(path: '')));

      //act
      final actual = datasource.getAll();

      //assert
      expect(actual, throwsA(isA<Exception>()));
    },
  );
}
