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
  }
}
