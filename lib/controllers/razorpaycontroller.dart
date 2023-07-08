import 'package:agridoc/repository/handlers/product_handler.dart';
import 'package:agridoc/views/home/home_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RazorPay extends GetxController {
  late Razorpay _razorpay;

  late BuildContext mycontext;
  late Map<String, dynamic> details;

  @override
  void onInit() async {
    super.onInit();
  }

  void razorpayinit(
      int amount, BuildContext context, Map<String, dynamic> details) async {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    this.details = details;

    String orderId = await getOrderId(amount);

    mycontext = context;

    var options = {
      'key': 'rzp_test_wETNF35sC1u8UJ',
      'amount': amount * 100,
      'name': 'Agridoc',
      'order_id': orderId,
      'description': '',
      "prefill": {
        "contact": "+919372397615",
        "email": 'parbat@gmail.com',
      },
      "readonly": {
        "email": true,
        "contact": true,
      },
      "checkout": {
        "method": {'netbanking': 0, 'card': 0, 'upi': 1, 'wallet': 1}
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {}
  }

  Future<String> getOrderId(int amount) async {
    final response = await http.post(
        Uri.parse(
            'https://book2play.el.r.appspot.com/api/v1/razorpay/create/orderId'),
        headers: {
          'content-type': 'application/json',
        },
        body: jsonEncode({
          'amount': amount * 100,
        }));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['orderId'];
    }

    return '';
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    ProductHandler handler = ProductHandler();
    handler.addDelivery(details);
    Get.offAndToNamed('/home');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    mycontext.loaderOverlay.hide();
  }

  void _handleExternalWallet(ExternalWalletResponse response) {}
}
