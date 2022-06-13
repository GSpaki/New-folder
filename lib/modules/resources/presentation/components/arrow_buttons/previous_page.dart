import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../resource_datatable/bloc/resource_datatable_bloc.dart';

class PreviousPageButton extends StatelessWidget {
  const PreviousPageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DatatableBloc>();

    final bool isFirstPage = (cubit.state as DatatableLoadedState).currentPage == 1;

    return IconButton(
      onPressed: isFirstPage ? null : () => cubit.add(PreviousPageEvent()),
      icon: const Icon(Icons.navigate_before_rounded),
      splashRadius: 15,
    );
  }
}
