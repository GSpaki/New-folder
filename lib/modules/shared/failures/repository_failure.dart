import 'i_failure.dart';

abstract class IRepositoryFailure implements IFailure {}

class OnlineRepositoryFailure implements IRepositoryFailure {}

class LocalRepositoryFailure implements IRepositoryFailure {}
