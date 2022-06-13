part of 'resource_datatable_bloc.dart';

abstract class DatatableEvent {}

class NextPageEvent implements DatatableEvent {}

class PreviousPageEvent implements DatatableEvent {}

class ShowLoadedDataEvent implements DatatableEvent {
  final int numberOfItems;

  ShowLoadedDataEvent(this.numberOfItems);
}
