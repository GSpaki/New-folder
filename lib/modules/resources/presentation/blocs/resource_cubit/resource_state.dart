part of 'resource_cubit.dart';

abstract class ResourceState {}

class ResourceInitialState extends ResourceState {}

class ResourceLoadingState extends ResourceState {}

class ResourceLoadedState extends ResourceState {
  final List<ResourceEntity> entitiesList;

  ResourceLoadedState(this.entitiesList);
}

class ResourceFailureState extends ResourceState {
  final IFailure failure;

  ResourceFailureState(this.failure);
}
