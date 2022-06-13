part of 'resource_datatable_bloc.dart';

abstract class DatatableState {}

class DatatableInitialState implements DatatableState {}

class DatatableLoadedState implements DatatableState {
  int numberOfItems;
  int itemsPerPage;
  int currentPage;
  List<String> filterLanguage;
  String? searchedString;
  bool? isCreatedDateAscending;
  bool? isUpdatedDateAscending;
  bool? isResourceIdAscending;
  bool? isModuleIdAscending;
  bool? isLanguageIdAscending;
  bool? isValueAscending;
  DatatableLoadedState({
    required this.numberOfItems,
    this.itemsPerPage = 10,
    this.currentPage = 1,
    this.filterLanguage = const [],
    this.searchedString,
    this.isCreatedDateAscending,
    this.isUpdatedDateAscending,
    this.isResourceIdAscending,
    this.isModuleIdAscending,
    this.isLanguageIdAscending,
    this.isValueAscending,
  });

  int get lastPage => (numberOfItems ~/ itemsPerPage) + 1;

  void clearFilters() {
    searchedString = null;
    isCreatedDateAscending = null;
    isUpdatedDateAscending = null;
    isResourceIdAscending = null;
    isModuleIdAscending = null;
    isLanguageIdAscending = null;
    isValueAscending = null;
  }

  DatatableLoadedState copyWith({
    int? numberOfItems,
    int? itemsPerPage,
    int? currentPage,
    List<String>? filterLanguage,
    String? searchedString,
    bool? isCreatedDateAscending,
    bool? isUpdatedDateAscending,
    bool? isResourceIdAscending,
    bool? isModuleIdAscending,
    bool? isLanguageIdAscending,
    bool? isValueAscending,
  }) {
    return DatatableLoadedState(
      numberOfItems: numberOfItems ?? this.numberOfItems,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
      currentPage: currentPage ?? this.currentPage,
      filterLanguage: filterLanguage ?? this.filterLanguage,
      searchedString: searchedString ?? this.searchedString,
      isCreatedDateAscending: isCreatedDateAscending ?? this.isCreatedDateAscending,
      isUpdatedDateAscending: isUpdatedDateAscending ?? this.isUpdatedDateAscending,
      isResourceIdAscending: isResourceIdAscending ?? this.isResourceIdAscending,
      isModuleIdAscending: isModuleIdAscending ?? this.isModuleIdAscending,
      isLanguageIdAscending: isLanguageIdAscending ?? this.isLanguageIdAscending,
      isValueAscending: isValueAscending ?? this.isValueAscending,
    );
  }
}
