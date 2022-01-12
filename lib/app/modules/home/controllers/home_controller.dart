import 'package:get/get.dart';
import 'package:granter_challenger/app/data/models/product_model.dart';
import 'package:granter_challenger/app/data/services/product_service.dart';

class HomeController extends GetxController {
  final _dao = ProductDAO();
  
  var list = Future.value(<Product>[]).obs;
  
  HomeController(){
    refreshList();
  }
  
  remove(dynamic id){
    _dao.remove(id);
    refreshList();
  }

  save(Product product){
    _dao.save(product);
    refreshList();

  }

  refreshList() {
    list.value = _dao.find();
  }
}
