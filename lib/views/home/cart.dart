import 'package:agridoc/models/cart.dart';
import 'package:agridoc/repository/handlers/product_handler.dart';
import 'package:agridoc/utils/text_sizes.dart';
import 'package:agridoc/views/home/checkout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  ProductHandler _productHandler = ProductHandler();
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "My Cart",
              style: headingBold,
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: _productHandler.getCart(),
                builder: (context, AsyncSnapshot<List<cart>> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            "Your cart is Empty",
                            style: headingBold,
                          ),
                        ),
                      );
                    }
                    return Column(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              total += snapshot.data![index].quantity! *
                                  snapshot.data![index].product!.price!;
                              return showCard(snapshot.data![index]);
                            }),
                        SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(CheckoutPage(amount: total));
                            },
                            child: Text("Checkout",
                                style: poppinsFont.copyWith(
                                  fontSize: 16,
                                )),
                            style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                minimumSize: Size(200, 50)),
                          ),
                        ),
                      ],
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ],
        ),
      ),
    ));
  }

  showCard(cart cart) {
    RxInt quantity = cart.quantity!.obs;
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              width: 100,
              child: AspectRatio(
                aspectRatio: 9 / 11,
                child: Image.network(
                  cart.product!.images![0],
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  cart.product!.name!,
                  style: headingBold.copyWith(fontSize: 20),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                RichText(
                  text: TextSpan(
                    text: '₹${cart.product!.price!}',
                    style: poppinsFont.copyWith(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' x ${cart.quantity}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                showChangeIndicator(quantity)
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.grey,
                  size: 30,
                )),
          )
        ],
      ),
    );
  }

  showChangeIndicator(RxInt quantity) {
    return Container(
      width: 100,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          IconButton(
            constraints: BoxConstraints(
              maxHeight: 25,
            ),
            onPressed: () {
              quantity.value++;
            },
            icon: Icon(Icons.add),
            padding: EdgeInsets.all(0),
          ),
          SizedBox(
            width: 10,
          ),
          Obx(
            () => Text("${quantity.value.toString()}"),
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
              constraints: BoxConstraints(
                maxHeight: 25,
              ),
              onPressed: () {
                quantity.value--;
              },
              icon: Icon(Icons.remove),
              padding: EdgeInsets.all(0)),
        ],
      ),
    );
  }
}
