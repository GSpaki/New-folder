import 'package:dio/dio.dart';

import '../infra/i_datasources/i_datasource.dart';

class ResourceDatasource implements IDatasource {
  final Dio _dio;

  ResourceDatasource(this._dio);
  @override
  Future<List<dynamic>> getAll() async {
    final Response<List> response;

    try {
      response = await _dio.get('http://portal.greenmilesoftware.com/get_resources_since');
    } on Exception {
      rethrow;
    }
    return response.data!;
  }
}
