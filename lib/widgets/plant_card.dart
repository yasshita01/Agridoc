import 'dart:developer';

import 'package:agridoc/models/product.dart';
import 'package:agridoc/repository/handlers/product_handler.dart';
import 'package:agridoc/utils/text_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class PlantCard extends StatelessWidget {
  PlantCard({Key? key, required this.product, required this.onTap})
      : super(key: key);

  Product product;
  VoidCallback onTap;
  RxBool isFav = false.obs;

  @override
  Widget build(BuildContext context) {
    isFav.value = product.isFavourite!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 10),
        width: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 5,
                spreadRadius: 5,
              )
            ]),
        child: Stack(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    alignment: Alignment.center,
                    // width: double.infinity,

                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: AspectRatio(
                      aspectRatio: 9 / 11,
                      child: Image.network(
                        product.images![0],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  product.name!.substring(
                      0, product.name!.length > 18 ? 18 : product.name!.length),
                  style:
                      headingBold.copyWith(fontSize: 16, color: Colors.black),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹${product.price}",
                      style: headingBold.copyWith(
                          fontSize: 16, color: Colors.black),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(108, 210, 87, 1),
                          shape: BoxShape.circle),
                      child: IconButton(
                          constraints: BoxConstraints(
                              minWidth: 35,
                              minHeight: 35,
                              maxHeight: 35,
                              maxWidth: 35),
                          onPressed: () {
                            ProductHandler productHandler = ProductHandler();
                            productHandler.addToCart(product.sId!, 1);
                          },
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                            size: 20,
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    addToFavourite();
                  },
                  splashRadius: 30,
                  icon: Obx(() => Icon(
                        Icons.favorite,
                        color: isFav.value ? Colors.red : Colors.grey,
                      ))),
            ),
          ),
        ]),
      ),
    );
  }

  addToFavourite() async {
    ProductHandler ph = ProductHandler();

    try {
      if (product.isFavourite == true &&
          await ph.deleteFavourites(product.sId!)) {
        product.isFavourite = false;
        isFav.value = product.isFavourite!;
      } else if (await ph.addToFavourites(product.sId!)) {
        product.isFavourite = true;
        isFav.value = product.isFavourite!;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
