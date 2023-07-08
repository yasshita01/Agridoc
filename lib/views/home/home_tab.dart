import 'package:agridoc/blocs/auth_bloc/auth_bloc_bloc.dart';
import 'package:agridoc/utils/image_chooser.dart';
import 'package:agridoc/views/home/cart.dart';
import 'package:agridoc/views/home/checkout.dart';
import 'package:agridoc/views/home/favourites.dart';
import 'package:agridoc/views/home/home.dart';
import 'package:agridoc/views/home/predict.dart';
import 'package:agridoc/views/home/profile.dart';
import 'package:agridoc/views/onboarding/login.dart';
import 'package:agridoc/views/onboarding/signup.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class HomeTabPage extends StatefulWidget {
  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          HomePage(),
          CartPage(),
          PredictPage(),
          FavouritesScreen(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: TabBar(
          indicatorColor: Colors.transparent,
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(
                Icons.home,
              ),
            ),
            Tab(
              icon: Icon(Icons.shopping_cart),
            ),
            Tab(
              icon: Icon(Icons.center_focus_strong),
            ),
            Tab(
              icon: Icon(Icons.favorite),
            ),
            Tab(
              icon: Icon(Icons.account_circle),
            ),
          ]),
    );
  }
}
