import 'package:rxdart/rxdart.dart';
import 'package:wisata_surabaya/locator.dart';
import 'package:wisata_surabaya/src/model/service_model.dart';
import 'package:wisata_surabaya/src/services/exception.dart';
import 'package:wisata_surabaya/src/model/wisata_model/list_wisata_model.dart';
import 'package:wisata_surabaya/src/repository/wisata_repository.dart';

class ListWisataBloc{

  ListWisataBloc(){
    getListWisata();
  }
  final wisataRepository = locator<WisataRepository>();

  final listWisata = PublishSubject<ServiceModel<ListWisataModel>>();

  Stream<ServiceModel<ListWisataModel>> get listWisataStream => listWisata.stream;

  getListWisata() async{
    try{
      var listPlace = await wisataRepository.getListPlace();
      listWisata.sink.add(ServiceModel.completed(listPlace));
    }catch(e){

      if(e is ErrorException){
        listWisata.sink.add(ServiceModel.dioError(e));
      }else{
        listWisata.sink.add(ServiceModel.error("Unkown Data"));
      }
    }
  }

  dispose() {
    listWisata.close();
  }
}