import 'package:agridoc/utils/text_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/product.dart';

class PopularProduct extends StatelessWidget {
  PopularProduct({Key? key, required this.product, required this.onTap})
      : super(key: key);

  Product product;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 10),
      width: 230,
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
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Flexible(
            child: AspectRatio(
                aspectRatio: 9 / 12, child: Image.network(product.images![0])),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                product.name!.substring(
                    0, product.name!.length > 18 ? 18 : product.name!.length),
                style: headingBold.copyWith(fontSize: 16, color: Colors.black),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "₹${product.price}",
                style: headingBold.copyWith(fontSize: 16, color: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }
}
