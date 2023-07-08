import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart';

import '../../blocs/auth_bloc/auth_bloc_bloc.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 251, 253, 1),
      body: BlocListener<AuthBloc, AuthBlocState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Future.delayed(const Duration(seconds: 5))
                .then((value) => Get.offAllNamed('/home'));
          } else {
            Future.delayed(const Duration(seconds: 5))
                .then((value) => Get.offAllNamed('/login'));
          }
        },
        child: Center(
          child: Image.asset("assets/images/ezgif.com-video-to-gif.gif"),
        ),
      ),
    );
  }
}
