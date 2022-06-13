import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:project/modules/resources/presentation/components/resource_datatable/bloc/resource_datatable_bloc.dart';

import 'data/usecases/get_all_resources.dart';
import 'external/resource_datasource.dart';
import 'infra/repositories/resource_repository.dart';
import 'presentation/blocs/resource_cubit/resource_cubit.dart';
import 'ui/pages/resource_page.dart';

class ResourceModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => ResourceDatasource(i())),
        Bind((i) => ResourceRepository(i())),
        Bind((i) => GetAllResourcesUsecase(i())),
        BlocBind.lazySingleton((i) => ResourceCubit(getAllUsecase: i())),
        BlocBind.lazySingleton((i) => DatatableBloc()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => ResourcePage()),
      ];
}
