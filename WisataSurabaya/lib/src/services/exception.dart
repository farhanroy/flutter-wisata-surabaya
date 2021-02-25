import 'package:dio/dio.dart';

class ErrorException{
  final DioError error;

  ErrorException({this.error});
}

class UnknownException{
  final String message;

  UnknownException({this.message});
}