import 'package:agridoc/blocs/products/products_bloc.dart';
import 'package:agridoc/languages/language.dart';
import 'package:agridoc/repository/handlers/product_handler.dart';
import 'package:agridoc/utils/text_sizes.dart';
import 'package:agridoc/views/home/details.dart';
import 'package:agridoc/views/home/searchproducts.dart';
import 'package:agridoc/widgets/circle_button.dart';
import 'package:agridoc/widgets/plant_card.dart';
import 'package:agridoc/widgets/popular_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../blocs/api_handler/api_handler_bloc.dart';
import '../../models/product.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> selectCat = [
    "Plant",
    "Fertilizer",
    "Seed",
    "Tools",
  ];
  final ProductsBloc _products = ProductsBloc();
  RxInt selectIndex = 0.obs;

  @override
  void initState() {
    _products.add(ProductFetchEvent(category: "Plant"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: BlocProvider(
            create: (context) => _products,
            child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome,", style: headingBold),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 5,
                            child: GestureDetector(
                              onTap: () {
                                showSearch(
                                    context: context,
                                    delegate: SearchProductDelegate());
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                      )
                                    ]),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "Search",
                                      style: poppinsFont.copyWith(
                                          color: Colors.grey, fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Container(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(Icons.tune),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ))
                        ],
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        minHeight: 60,
                        maxHeight: 100,
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          itemCount: selectCat.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            return Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Obx(
                                  () => ChoiceChip(
                                      label: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          selectCat[index],
                                          style: poppinsFont.copyWith(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      onSelected: (val) {
                                        if (val) {
                                          _products.add(ProductFetchEvent(
                                              category: selectCat[index]));
                                          selectIndex.value = index;
                                        }
                                      },
                                      selected: selectIndex.value == index
                                          ? true
                                          : false),
                                ));
                          })),
                    ),
                    if (state is ProductFetch)
                      Container(
                        constraints: const BoxConstraints(
                          minHeight: 280,
                          maxHeight: 300,
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: state.product.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              return PlantCard(
                                product: state.product[index],
                                onTap: () {
                                  Get.to(() => DetailsPage(
                                        product: state.product[index],
                                      ));
                                },
                              );
                            })),
                      ),
                    if (state is ProductsInitial)
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Popular  ", style: headingBold),
                    SizedBox(
                      height: 10,
                    ),
                    if (state is ProductFetch)
                      Container(
                        constraints: const BoxConstraints(
                          minHeight: 100,
                          maxHeight: 120,
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: state.product.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              return PopularProduct(
                                product: state.product[index],
                                onTap: () {
                                  Get.to(() => DetailsPage(
                                        product: state.product[index],
                                      ));
                                },
                              );
                            })),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
