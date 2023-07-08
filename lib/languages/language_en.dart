import 'package:agridoc/languages/language.dart';

class LanguageEN extends Languages {
  @override
  String get appName => 'Agridoc';

  @override
  String get country => 'India';

  @override
  String get login => "login";

  @override
  String get phone => "Phone number";

  @override
  String get signUp => 'Sign Up';

  @override
  String get welcome => "Welcome";

  @override
  String get password => 'Password';

  @override
  String get needAccount => "Don't have an Account";

  @override
  String get username => 'username';

//Home Page
  @override
  String get welcomeMessage => "Welcome to the ecommerce app";
  @override
  String get addToCart => "Add to Cart";
  @override
  String get checkout => "Checkout";
  @override
  String get cart => "Cart";
  @override
  String get productDetails => "Product Details";
  @override
  String get quantity => "Quantity";
  @override
  String get totalPrice => "Total Price";

  //Profile Page
  @override
  String get profile => "Profile";
  @override
  String get orderHistory => "Order History";
  @override
  String get settings => "Settings";
  @override
  String get logout => "Logout";

  //Orders
  @override
  String get orders => "Orders";
  @override
  String get orderNumber => "Order Number";
  @override
  String get orderDate => "Order Date";
  @override
  String get orderStatus => "Order Status";
  @override
  String get viewDetails => "View Details";

  //Articles
  @override
  String get articles => "Articles";
  @override
  String get articleTitle => "Article Title";
  @override
  String get articleAuthor => "Article Author";
  @override
  String get articleDate => "Article Date";
  @override
  String get readMore => "Read More";
}
