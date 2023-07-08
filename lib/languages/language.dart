import 'package:agridoc/utils/cache_language.dart';
import 'package:agridoc/utils/localization_delegate.dart';
import 'package:flutter/cupertino.dart';

import 'language_en.dart';
import 'language_hi.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    String lang = CacheLanguage.getLanguage();
    return loadLang(Locale(lang));
  }

  static loadLang(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEN();

      case 'hn':
        return LanguageHN();

      default:
        return LanguageEN();
    }
  }

  String get appName;
  String get country;
  String get phone;
  String get welcome;
  String get signUp;
  String get login;
  String get password;
  String get needAccount;
  String get username;

  //Home Page
  String get welcomeMessage;
  String get addToCart;
  String get checkout;
  String get cart;
  String get productDetails;
  String get quantity;
  String get totalPrice;

  //Profile
  String get profile;
  String get orderHistory;
  String get settings;
  String get logout;

  //Orders
  String get orders;
  String get orderNumber;
  String get orderDate;
  String get orderStatus;
  String get viewDetails;

  //Articles
  String get articles;
  String get articleTitle;
  String get articleAuthor;
  String get articleDate;
  String get readMore;
}
