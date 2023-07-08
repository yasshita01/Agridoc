import 'dart:io';

import 'package:agridoc/utils/image_chooser.dart';
import 'package:agridoc/utils/text_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class PredictPage extends StatefulWidget {
  PredictPage({Key? key}) : super(key: key);

  @override
  State<PredictPage> createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
  showDisease(String a, File image) {
    isPicked.value = true;
    disease = a;
    _image = image;
    context.loaderOverlay.hide();
  }

  RxBool isPicked = false.obs;

  String disease = "";

  late File _image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LoaderOverlay(
            child: Obx(
                () => !isPicked.value ? showPickButton() : showDiseaseCard())),
      ),
    );
  }

  showDiseaseCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 5,
              blurRadius: 5,
            )
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 200,
            child: Image.file(
              _image,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            disease,
            style: headingBold,
          )
        ],
      ),
    );
  }

  showResult() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Pesticides',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _Card(
                  name: 'Agro Plus AM003_1 Pesticide',
                  price: '₹ 1000',
                  imageUrl:
                      'https://m.media-amazon.com/images/I/41wLneRlhJL._SX300_SY300_QL70_FMwebp_.jpg',
                ),
                _Card(
                  name: 'ROUNDUP HERBICIDE',
                  price: '₹ 2300',
                  imageUrl:
                      'https://cdn.shopify.com/s/files/1/0722/2059/products/Roundup_1800x1800.jpg?v=1671198559',
                ),
                _Card(
                  name: 'TATA Tafgor 5L',
                  price: '₹ 3400',
                  imageUrl:
                      'https://m.media-amazon.com/images/I/41wLneRlhJL._SX300_SY300_QL70_FMwebp_.jpg',
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Plants',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _Card(
                  name: 'Peperomia Green Plant',
                  price: '\$19.99',
                  imageUrl:
                      'https://cdn.shopify.com/s/files/1/0579/7924/0580/products/peperomia-green-plant-31793195614340.jpg?v=1675612452',
                ),
                _Card(
                  name: 'Zuri Planter Ball Rib',
                  price: '\$14.99',
                  imageUrl:
                      'https://cdn.shopify.com/s/files/1/0579/7924/0580/products/small-ivory-zuri-planter-ball-rib-31642661617796.jpg?v=1676035721',
                ),
                _Card(
                  name: 'Heraldry Vase Taper',
                  price: '\$24.99',
                  imageUrl:
                      'https://cdn.shopify.com/s/files/1/0579/7924/0580/products/black-heraldry-vase-taper-31642885980292.jpg?v=1675595157',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _Card({String? name, String? price, String? imageUrl}) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.network(
              imageUrl!,
              width: 100,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name!,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Price: ${price}',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  //Add to Cart functionality
                },
                child: Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showPickButton() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff22c1c3), Color(0xfffdbb2d)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            context.loaderOverlay.show();
            ImageChooser().PopupSelector(context, showDisease);
          },
          child: Text(
            'Pick an Image',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
