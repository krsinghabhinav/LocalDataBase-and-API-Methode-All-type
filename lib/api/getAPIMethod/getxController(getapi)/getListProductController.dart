import 'package:get/get.dart';
import 'package:sqflitetestdeloacal/api/getAPIMethod/model(getapi)/getProductModel.dart';

import '../repos(getapi)/getproductListrepo.dart';

class GetlistproductGetxController extends GetxController {
  Getproductlistrepo getproductlistrepo = Getproductlistrepo();

  var productmodel = <getProductModel>[].obs;
  var isLoading = false.obs;

  Future<void> getListGetxControll() async {
    try {
      isLoading.value = true;
      var data = await getproductlistrepo.getProductRepo();
      productmodel.value = data ?? [];
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
