import 'package:flutter/material.dart';
import 'package:sqflitetestdeloacal/api/getAPIMethod/repos(getapi)/getproductListrepo.dart';

import '../repos(getapi)/getProductWithoutmodel.dart';

class GetproductwithoutmodelProvider extends ChangeNotifier {
  GetproductlistWithoutModelRepo getproductlistrepo = GetproductlistWithoutModelRepo();
  bool isloading = false;
  List<dynamic>? productModel = [];

  Future<void> getProductContro() async {
    try {
      isloading = true;
      notifyListeners();
      productModel = await getproductlistrepo.getProductRepo();
      isloading = false;
      notifyListeners();
    } on Exception catch (e) {
      isloading = false;
      notifyListeners();
      print(e);
    }
  }
}
