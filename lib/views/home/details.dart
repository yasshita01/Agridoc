import 'package:agridoc/models/product.dart';
import 'package:agridoc/utils/text_sizes.dart';
import 'package:agridoc/views/home/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key, required this.product}) : super(key: key);
  Product product;
  RxInt quantity = 1.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverLayoutBuilder(builder: (context, constraints) {
            return SliverAppBar(
              backgroundColor: Colors.white,
              flexibleSpace: constraints.scrollOffset < 120
                  ? Image.network(product.images![0])
                  : Container(),
              expandedHeight: 280,
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 28,
                  )),
              actions: [
                Container(
                  margin: EdgeInsets.only(right: 10, top: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(65, 109, 80, 1)),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_outline,
                        size: 30,
                      )),
                ),
              ],
            );
          }),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name!,
                              style: headingBold.copyWith(fontSize: 27),
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                            ),
                            Text(
                              "₹${product.price}",
                              style: headingBold.copyWith(
                                  fontSize: 24, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                      RatingBarIndicator(
                        rating: 2.75,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 25.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  showChangeIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Description",
                      style: poppinsFont.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.description!,
                    style: poppinsFont.copyWith(fontSize: 14),
                    maxLines: 8,
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Buy Now",
                      style: buttonStyle,
                    ),
                  ],
                ),
                onPressed: () {
                  showPaymentDialog(context);
                },
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    minimumSize: Size(double.infinity, 50)),
              ),
            ),
          )
        ],
      )),
    );
  }

  showPaymentDialog(context) {
    int total = (quantity.value * product.price!) + 40 + 10 + 25;
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => Container(
              height: 360,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Container(
                margin: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment",
                        style: headingBold.copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          product.name!,
                          style: headingBold.copyWith(
                              color: Colors.white, fontSize: 18.5),
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                        trailing: Text(
                          "₹${product.price! * quantity.value}",
                          style: headingBold.copyWith(
                              color: Colors.white, fontSize: 18.5),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          "Packaging",
                          style: headingBold.copyWith(
                              color: Colors.grey, fontSize: 18.5),
                        ),
                        trailing: Text(
                          "₹40",
                          style: headingBold.copyWith(
                              color: Colors.white, fontSize: 18.5),
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          "Delivery",
                          style: headingBold.copyWith(
                              color: Colors.grey, fontSize: 18.5),
                        ),
                        trailing: Text(
                          "₹25",
                          style: headingBold.copyWith(
                              color: Colors.white, fontSize: 18.5),
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          "Tax",
                          style: headingBold.copyWith(
                              color: Colors.grey, fontSize: 18.5),
                        ),
                        trailing: Text(
                          "₹10",
                          style: headingBold.copyWith(
                              color: Colors.white, fontSize: 18.5),
                        ),
                      ),
                      ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Text(
                            "total",
                            style: headingBold.copyWith(
                              color: Colors.grey,
                              fontSize: 16.5,
                            ),
                          ),
                          subtitle: Text(
                            "₹${total}",
                            style: headingBold.copyWith(
                              color: Colors.white,
                              fontSize: 18.5,
                            ),
                          ),
                          trailing: ElevatedButton(
                              onPressed: () {
                                Get.to(CheckoutPage(amount: total));
                              },
                              child: Text(
                                "Continue",
                                style: poppinsFont.copyWith(fontSize: 16),
                              ),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(150, 50),
                                  shape: StadiumBorder()))),
                    ],
                  ),
                ),
              ),
            ));
  }

  showChangeIndicator() {
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
