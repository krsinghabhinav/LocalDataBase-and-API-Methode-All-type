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
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Getproductwithouthmodelui(),
      ),
    );
  }
}
