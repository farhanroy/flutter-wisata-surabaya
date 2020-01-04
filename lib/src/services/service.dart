import 'package:dio/dio.dart';
import 'package:wisata_surabaya/locator.dart';
import 'package:wisata_surabaya/src/services/base_api.dart';

class Service{
  final BaseApi baseApi = locator<BaseApi>();
  Future<Response> getListWisata() async {
    return await baseApi.get('/wisata');
  }
}