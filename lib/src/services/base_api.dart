import 'package:dio/dio.dart';
import 'package:wisata_surabaya/src/utils/constant.dart';

import 'exception.dart';

class BaseApi{

  Dio dio;

  BaseApi(){
    dio = NetworkClient().dio;
  }

  Future<Response> get(String url) async {
    var response;
    try {
      response = await dio.get(url);
    } catch(e) {
      if (e is DioError) {
        throw ErrorException(error: e);
      } else {
        throw UnknownException(message: 'Unknown Exception');
      }
    }
    return response;
  }


}

class NetworkClient {

  Dio dio;

  NetworkClient(){
    dio = Dio(options);
  }

  BaseOptions options = new BaseOptions(
    baseUrl: Constant.baseUrl,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

}