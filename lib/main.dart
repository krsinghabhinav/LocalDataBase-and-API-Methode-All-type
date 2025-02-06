import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import 'api/deleteAPIMethod/delete_Provider/delete_providerController.dart';
import 'api/deleteAPIMethod/delete_Provider/delete_providerControllerM111.dart';
import 'api/deleteAPIMethod/delete_Provider_UI/delete_provider_UI.dart';
import 'api/deleteAPIMethod/delete_Provider_UI/delete_provider_m1111_ui.dart';
import 'api/deleteAPIMethod/delete_getx_ui/delete_getXdata_UI.dart';
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
import 'api/put_petch_API_Method/putpetch_Getx_UI/put_petch_Getx_UI.dart';
import 'api/put_petch_API_Method/putpetch_Provider_ui/put_petch_createjob_UI.dart';
import 'api/put_petch_API_Method/putpetch_provider/putapi_ProviderController.dart';

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
        ChangeNotifierProvider(
            create: (_) => PostapicreateWithoutModelprovider()),
        ChangeNotifierProvider(create: (_) => PutapiProvidercontroller()),
        ChangeNotifierProvider(create: (_) => DeleteProvidercontroller()),
        ChangeNotifierProvider(create: (_) => DeleProviderControllerM1111()),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: DeleteGetxdataUi(),
      ),
    );
  }
}
