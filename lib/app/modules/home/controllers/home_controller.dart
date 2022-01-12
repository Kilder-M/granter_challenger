import 'package:get/get.dart';
import 'package:granter_challenger/app/data/models/product_model.dart';
import 'package:granter_challenger/app/data/services/product_service.dart';

class HomeController extends GetxController {
  final _dao = ProductDAO();
  
  var list = Future.value(<Product>[]);
  
  HomeController(){
    refreshList();
  }
  

  refreshList() {
    list = _dao.find();
  }
}
