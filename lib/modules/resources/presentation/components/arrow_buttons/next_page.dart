import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../resource_datatable/bloc/resource_datatable_bloc.dart';

class NextPageButton extends StatelessWidget {
  const NextPageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DatatableBloc>();

    final bool isLastPage = (cubit.state as DatatableLoadedState).currentPage == (cubit.state as DatatableLoadedState).lastPage;

    return IconButton(
      onPressed: isLastPage ? null : () => cubit.add(NextPageEvent()),
      icon: const Icon(Icons.navigate_next_rounded),
      splashRadius: 15,
    );
  }
}
