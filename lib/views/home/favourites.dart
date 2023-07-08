import 'package:agridoc/models/favourites.dart';
import 'package:agridoc/repository/handlers/product_handler.dart';
import 'package:agridoc/utils/text_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FavouritesScreen extends StatelessWidget {
  FavouritesScreen({Key? key}) : super(key: key);
  ProductHandler _productHandler = ProductHandler();

  List images = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            leadingWidth: 0,
            leading: Container(),
            title: Text(
              "Favourites",
              style: headingBold.copyWith(fontWeight: FontWeight.w800),
            ),
          ),
          SliverToBoxAdapter(
            child: FutureBuilder(
                future: _productHandler.getFavourites(),
                builder: (context, AsyncSnapshot<List<Favourite>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return favCard(snapshot.data![index]);
                        });
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          )
        ],
      )),
    );
  }

  favCard(Favourite favourite) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(65, 109, 80, 0.3),
            spreadRadius: 5,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(65, 109, 80, 0.3),
                    spreadRadius: 5,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                favourite.productId!.images![0],
              )),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Text(
                          favourite.productId!.name!,
                          style: headingBold.copyWith(fontSize: 20),
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       color: Colors.grey.shade200, shape: BoxShape.circle),
                      //   child: IconButton(
                      //       onPressed: () {},
                      //       icon: Icon(
                      //         Icons.favorite,
                      //         color: Colors.red,
                      //       )),
                      // ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "₹${favourite.productId!.price!}",
                        style: headingBold.copyWith(
                            fontSize: 16, color: Colors.green),
                      ),
                      Text(
                        "3.5 ⭐",
                        style: headingBold.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Add to Cart",
                      style: poppinsFont.copyWith(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        side: BorderSide(width: 1, color: Colors.green)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
