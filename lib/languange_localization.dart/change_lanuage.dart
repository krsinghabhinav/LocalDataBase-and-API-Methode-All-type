import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'provider_controller.dart';

enum Language { English, Hindi, Spanich }

class Changeapplangang extends StatefulWidget {
  const Changeapplangang({super.key});

  @override
  State<Changeapplangang> createState() => _ChangeapplangangState();
}

class _ChangeapplangangState extends State<Changeapplangang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.helloWorld),
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            // Add your logout logic here
            print(AppLocalizations.of(context)!.farewell);
          },
        ),
        actions: [
          Consumer<ProviderController>(
            builder: (BuildContext context, providervalue, Widget? child) {
              return PopupMenuButton(
                onSelected: (Language item) {
                  if (item == Locale("en")) {
                    providervalue.changeLanguage(Locale("en"));
                  } else if (item == Locale('hi')) {
                    providervalue.changeLanguage(Locale("hi"));
                  } else {
                    providervalue.changeLanguage(Locale("es"));
                  }
                },
                itemBuilder: (context) => <PopupMenuEntry<Language>>[
                  PopupMenuItem(
                    value: Language.English,
                    child: Text("English"),
                  ),
                  PopupMenuItem(
                    value: Language.Hindi,
                    child: Text("Hindi"),
                  ),
                  PopupMenuItem(
                    value: Language.Spanich,
                    child: Text("Spanich"),
                  ),
                ],
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.greeting,
                style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text(AppLocalizations.of(context)!.welcomeMessage,
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text(AppLocalizations.of(context)!.loadingMessage,
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text(AppLocalizations.of(context)!.errorOccurred,
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text(AppLocalizations.of(context)!.userProfile,
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text(AppLocalizations.of(context)!.settings,
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implement the save changes action here
                print(AppLocalizations.of(context)!.saveButton);
              },
              child: Text(AppLocalizations.of(context)!.saveButton),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implement logout action
                print(AppLocalizations.of(context)!.logoutButton);
              },
              child: Text(AppLocalizations.of(context)!.logoutButton),
            ),
          ],
        ),
      ),
    );
  }
}
