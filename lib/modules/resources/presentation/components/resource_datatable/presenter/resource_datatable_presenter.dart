import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/modules/resources/presentation/components/resource_datatable/bloc/resource_datatable_bloc.dart';
import '../../../../domain/entities/resource_entity.dart';
import '../../arrow_buttons/arrow_buttons.dart';

class ResourceDatatablePresenter extends StatelessWidget {
  const ResourceDatatablePresenter({Key? key, required this.entitiesList}) : super(key: key);

  final List<ResourceEntity> entitiesList;

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<DatatableBloc>();

    if (bloc.state is DatatableLoadedState) {
      entitiesList.sort(
        ((a, b) => _sortState(a, b, bloc.state as DatatableLoadedState)),
      );

      final List<ResourceEntity> cropedList = _cropList(entitiesList, bloc.state as DatatableLoadedState);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              PreviousPageButton(),
              NextPageButton(),
            ],
          ),
          DataTable(
            columns: [
              DataColumn(
                  label: const Text('value'), onSort: (columnIndex, sortAscending) => bloc.add(SortEvent('value', sortAscending))),
              DataColumn(
                  label: const Text('language'),
                  onSort: (columnIndex, sortAscending) => bloc.add(SortEvent('language', sortAscending))),
              DataColumn(
                  label: const Text('module'), onSort: (columnIndex, sortAscending) => bloc.add(SortEvent('module', sortAscending))),
              DataColumn(
                  label: const Text('resource'),
                  onSort: (columnIndex, sortAscending) => bloc.add(SortEvent('resource', sortAscending))),
              DataColumn(
                  label: const Text('created at'),
                  onSort: (columnIndex, sortAscending) => bloc.add(SortEvent('created at', sortAscending))),
              DataColumn(
                  label: const Text('updated at'),
                  onSort: (columnIndex, sortAscending) => bloc.add(SortEvent('updated at', sortAscending))),
            ],
            rows: cropedList
                .map((entity) => DataRow(cells: [
                      DataCell(Text(entity.value)),
                      DataCell(Text(entity.languageId)),
                      DataCell(Text(entity.moduleId)),
                      DataCell(Text(entity.resourceId)),
                      DataCell(Text(entity.createdDate.toString())),
                      DataCell(Text(entity.updatedDate.toString())),
                    ]))
                .toList(),
          ),
        ],
      );
    } else {
      //state == initialState

      return const CircularProgressIndicator(
        color: Colors.green,
      );
    }
  }

  int _compareNullableDateTime(DateTime? createdDateA, DateTime? createdDateB, bool isDateAscending) {
    if (createdDateB == null) {
      return -1;
    } else if (createdDateA == null) {
      return 1;
    } else {
      return _compare(createdDateA.toString(), createdDateB.toString(), isDateAscending);
    }
  }

  int _compare(dynamic valueA, dynamic valueB, bool isDateAscending) {
    if (isDateAscending) {
      return valueA.compareTo(valueB);
    } else {
      return valueB.compareTo(valueA);
    }
  }

  int _sortState(a, b, DatatableLoadedState state) {
    //TODO: fix date sroting -> stackoverflow error
    // if (state.isCreatedDateAscending != null) {
    //   return _compareNullableDateTime(a.createdDate, b.createdDate, state.isCreatedDateAscending!);
    // } else if (state.isUpdatedDateAscending != null) {
    //   return _compareNullableDateTime(a.updatedDate, b.updatedDate, state.isUpdatedDateAscending!);
    // } else
    if (state.isModuleIdAscending != null) {
      return _compare(a.moduleId, b.moduleId, state.isModuleIdAscending!);
    } else if (state.isResourceIdAscending != null) {
      return _compare(a.resourceId, b.resourceId, state.isResourceIdAscending!);
    } else if (state.isValueAscending != null) {
      return _compare(a.value, b.value, state.isValueAscending!);
    } else if (state.isLanguageIdAscending != null) {
      return _compare(a.languageId, b.languageId, state.isLanguageIdAscending!);
    } else {
      return 0;
    }
  }

  List<ResourceEntity> _cropList(List<ResourceEntity> entitiesList, DatatableLoadedState state) {
    final int lastPage = (entitiesList.length ~/ state.itemsPerPage) + 1;
    if (lastPage != state.currentPage) {
      return entitiesList.sublist((state.currentPage - 1) * state.itemsPerPage, state.currentPage * state.itemsPerPage);
    } else {
      return entitiesList.sublist((state.currentPage - 1) * state.itemsPerPage);
    }
  }
}
