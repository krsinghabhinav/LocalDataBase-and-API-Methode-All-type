import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import 'api/deleteAPIMethod/delete_Provider/delete_providerController.dart';
import 'api/deleteAPIMethod/delete_Provider/delete_providerControllerM111.dart';

import 'api/getAPIMethod/providerController(getapi)/getListProductController.dart';
import 'api/getAPIMethod/providerController(getapi)/getproductWithoutmodel.dart';
import 'api/getAPIMethod/providerController(getapi)/getuserpostprovider.dart';

import 'api/image_api/image_provider/image_provider_controller.dart';
import 'api/postAPIMethod/ProviderController(postapi)/PostapiCreateProvider.dart';
import 'api/postAPIMethod/ProviderController(postapi)/postapicreateproviderwithoutmodel.dart';

import 'api/put_petch_API_Method/putpetch_provider/putapi_ProviderController.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'currentLocation.dart';
import 'languange_localization.dart/change_lanuage.dart';
import 'languange_localization.dart/provider_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        ChangeNotifierProvider(create: (_) => ImageProviderController()),
        ChangeNotifierProvider(create: (_) => ProviderController()),
      ],
      child: Consumer<ProviderController>(
        builder: (BuildContext context, providerController, Widget? child) {
          return GetMaterialApp(
            locale: providerController.locale ??
                const Locale("en"), // Set the saved locale
            supportedLocales: const [
              Locale('en'), // English
              Locale('es'), // Spanish
              Locale('hi'), // Hindi
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: LocationScreen(),
          );
        },
      ),
    );
  }
}
