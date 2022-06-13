import 'package:bloc/bloc.dart';

part 'resource_datatable_event.dart';
part 'resource_datatable_state.dart';

class DatatableBloc extends Bloc<DatatableEvent, DatatableState> {
  DatatableBloc() : super(DatatableInitialState()) {
    on<NextPageEvent>((event, emit) {
      if (state is DatatableLoadedState) {
        if ((state as DatatableLoadedState).currentPage != (state as DatatableLoadedState).lastPage) {
          emit((state as DatatableLoadedState).copyWith(currentPage: (state as DatatableLoadedState).currentPage + 1));
        }
      } else {
        throw UnimplementedError();
      }
    });

    on<PreviousPageEvent>((event, emit) {
      if (state is DatatableLoadedState) {
        if ((state as DatatableLoadedState).currentPage != 1) {
          emit((state as DatatableLoadedState).copyWith(currentPage: (state as DatatableLoadedState).currentPage - 1));
        }
      } else {
        throw UnimplementedError();
      }
    });

    on<ShowLoadedDataEvent>((event, emit) {
      emit(DatatableLoadedState(numberOfItems: event.numberOfItems));
    });

    on<SortEvent>((event, emit) {
      if (state is DatatableLoadedState) {
        DatatableLoadedState newState = DatatableLoadedState(numberOfItems: (state as DatatableLoadedState).numberOfItems);

        if (event.sortField == "value") {
          newState.isValueAscending = ((state as DatatableLoadedState).isValueAscending == null)
              ? event.isAscending
              : !(state as DatatableLoadedState).isValueAscending!;
        } else if (event.sortField == "language") {
          newState.isLanguageIdAscending = ((state as DatatableLoadedState).isLanguageIdAscending == null)
              ? event.isAscending
              : !(state as DatatableLoadedState).isLanguageIdAscending!;
        } else if (event.sortField == "module") {
          newState.isModuleIdAscending = ((state as DatatableLoadedState).isModuleIdAscending == null)
              ? event.isAscending
              : !(state as DatatableLoadedState).isModuleIdAscending!;
        } else if (event.sortField == "resource") {
          newState.isResourceIdAscending = ((state as DatatableLoadedState).isResourceIdAscending == null)
              ? event.isAscending
              : !(state as DatatableLoadedState).isResourceIdAscending!;
        } else if (event.sortField == "created at") {
          newState.isCreatedDateAscending = ((state as DatatableLoadedState).isCreatedDateAscending == null)
              ? event.isAscending
              : !(state as DatatableLoadedState).isCreatedDateAscending!;
        } else if (event.sortField == "updated at") {
          newState.isUpdatedDateAscending = ((state as DatatableLoadedState).isUpdatedDateAscending == null)
              ? event.isAscending
              : !(state as DatatableLoadedState).isUpdatedDateAscending!;
        }

        emit(newState);
      } else {
        throw UnimplementedError();
      }
    });
  }
}
