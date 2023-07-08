import 'package:agridoc/languages/language.dart';

class LanguageHN extends Languages {
  @override
  String get appName => 'एग्रीडॉक';

  @override
  String get country => 'भारत';

  @override
  String get login => 'लॉग इन करें';

  @override
  String get phone => 'फ़ोन नंबर';

  @override
  String get signUp => 'साइन अप करें';

  @override
  String get welcome => 'स्वागत';

  @override
  String get password => 'पासवर्ड';

  @override
  String get needAccount => 'खाता नहीं है';

  @override
  String get username => 'उपयोगकर्ता नाम';

  //Home Page
  @override
  String get welcomeMessage => "ई-कॉमर्स ऐप में आपका स्वागत है";
  @override
  String get addToCart => "कार्ट में जोड़ें";
  @override
  String get checkout => "चेकआउट";
  @override
  String get cart => "कार्ट";
  @override
  String get productDetails => "उत्पाद विवरण";
  @override
  String get quantity => "मात्रा";
  @override
  String get totalPrice => "कुल मूल्य";

  //Profile
  @override
  String get profile => "प्रोफाइल";

  @override
  String get orderHistory => "ऑर्डर इतिहास";

  @override
  String get settings => "सेटिंग्स";

  @override
  String get logout => "लोग आउट";

  //Orders
  @override
  String get orders => "आदेश";
  @override
  String get orderNumber => "ऑर्डर नंबर";
  @override
  String get orderDate => "ऑर्डर दिनांक";
  @override
  String get orderStatus => "ऑर्डर स्थिति";
  @override
  String get viewDetails => "विवरण देखें";

  //Articles
  @override
  String get articles => "लेख";
  @override
  String get articleTitle => "लेख शीर्षक";
  @override
  String get articleAuthor => "लेख लेखक";
  @override
  String get articleDate => "लेख दिनांक";
  @override
  String get readMore => "और पढ़ें";
}
