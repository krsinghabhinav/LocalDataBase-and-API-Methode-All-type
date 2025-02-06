import 'package:flutter/material.dart';
import 'package:sqflitetestdeloacal/api/getAPIMethod/model(getapi)/getProductModel.dart';
import 'package:sqflitetestdeloacal/api/getAPIMethod/repos(getapi)/getproductListrepo.dart';

class GetlistproductProviderController extends ChangeNotifier {
  Getproductlistrepo getproductlistrepo = Getproductlistrepo();
  bool isloading = false;
  List<getProductModel>? productModel=[];

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
