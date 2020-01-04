import '../services/exception.dart';

class ServiceModel<T> {
  Status status;
  T data;
  String message;
  ErrorException error;

  ServiceModel.completed(this.data) : status = Status.COMPLETED;
  ServiceModel.error(this.message) : status = Status.ERROR;
  ServiceModel.dioError(this.error): status = Status.DIOERROR;
}

enum Status { COMPLETED, ERROR, DIOERROR }