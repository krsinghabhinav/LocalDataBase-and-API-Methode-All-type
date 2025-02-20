import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderController extends ChangeNotifier {
  Locale? locale;

  // Load saved language from SharedPreferences when the app starts
  void loadSavedLanguage() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? languageCode = sp.getString('language');

    if (languageCode != null) {
      locale = Locale(languageCode);
    } else {
      locale = const Locale("en"); // Default to English if no saved language
    }

    notifyListeners(); // Notify listeners about the language change
  }

  // Method to change the language
  void changeLanguage(Locale type) async {
    locale = type;
    notifyListeners(); // Notify listeners about the change

    SharedPreferences sp = await SharedPreferences.getInstance();

    // Save the selected language code to SharedPreferences
    if (type == const Locale("en")) {
      await sp.setString('language', 'en');
    } else if (type == const Locale("hi")) {
      await sp.setString('language', 'hi');
    } else {
      await sp.setString('language', 'es');
    }

    notifyListeners();
  }
}
