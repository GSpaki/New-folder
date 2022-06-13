import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/modules/resources/presentation/components/resource_datatable/bloc/resource_datatable_bloc.dart';

import '../../../shared/failures/repository_failure.dart';
import '../../presentation/blocs/resource_cubit/resource_cubit.dart';
import '../components/arrow_buttons/arrow_buttons.dart';
import '../components/resource_datatable/presenter/resource_datatable_presenter.dart';

class ResourcePresenter extends StatelessWidget {
  const ResourcePresenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: () => context.read<ResourceCubit>().getResources(), child: Text('Button')),
          StateDisplay(),
        ],
      ),
    );
  }
}

class StateDisplay extends StatelessWidget {
  const StateDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ResourceCubit>();
    final datatableBloc = context.read<DatatableBloc>();

    if (cubit.state is ResourceLoadingState) {
      return (const CircularProgressIndicator());
    }
    if (cubit.state is ResourceLoadedState) {
      datatableBloc.add(ShowLoadedDataEvent((cubit.state as ResourceLoadedState).entitiesList.length));
      return ResourceDatatablePresenter(entitiesList: (cubit.state as ResourceLoadedState).entitiesList);
    }
    if (cubit.state is ResourceFailureState) {
      final failure = (cubit.state as ResourceFailureState).failure;
      if (failure is RepositoryFailure) {
        return (Text('repository failure'));
      }
      return (Text('datasource failure'));
    }

    return Text('initial');
  }
}
