import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import 'api/getAPIMethod/getxUi(getapi)/getProductListui.dart';
import 'api/getAPIMethod/getxUi(getapi)/getUserGetxUI.dart';
import 'api/getAPIMethod/providerController(getapi)/getListProductController.dart';
import 'api/getAPIMethod/providerController(getapi)/getproductWithoutmodel.dart';
import 'api/getAPIMethod/providerController(getapi)/getuserpostprovider.dart';
import 'api/getAPIMethod/providerUi(getapi)/getListProductProviderUi.dart';
import 'api/getAPIMethod/providerUi(getapi)/getUserProviderUI.dart';
import 'api/getAPIMethod/providerUi(getapi)/getproductWithouthModelUi.dart';
import 'api/postAPIMethod/ProviderController(postapi)/PostapiCreateProvider.dart';
import 'api/postAPIMethod/ProviderController(postapi)/postapicreateproviderwithoutmodel.dart';
import 'api/postAPIMethod/getxApiUI(postapi)/PostapicreatejobuiGetx.dart';
import 'api/postAPIMethod/postApiUi(postapi)/postCreatejobuiM2.dart';
import 'api/postAPIMethod/postApiUi(postapi)/postcreatejobuiWithoutModelUI.dart';
import 'api/postAPIMethod/postApiUi(postapi)/postsendjobui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Getuserpostprovider()),
        ChangeNotifierProvider(
            create: (_) => GetlistproductProviderController()),
        ChangeNotifierProvider(create: (_) => GetproductwithoutmodelProvider()),
        ChangeNotifierProvider(create: (_) => Postapicreateprovider()),
        ChangeNotifierProvider(create: (_) => PostapicreateWithoutModelprovider()),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: PostapicreatejobuiGetx(),
      ),
    );
  }
}
