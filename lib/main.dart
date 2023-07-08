import 'package:agridoc/blocs/api_handler/api_handler_bloc.dart';
import 'package:agridoc/blocs/auth_bloc/auth_bloc_bloc.dart';
import 'package:agridoc/blocs/locale/locale_bloc.dart';
import 'package:agridoc/languages/language.dart';
import 'package:agridoc/repository/handlers/product_handler.dart';
import 'package:agridoc/utils/cache_language.dart';
import 'package:agridoc/utils/light_theme.dart';
import 'package:agridoc/views/error.dart';
import 'package:agridoc/views/home/home.dart';
import 'package:agridoc/views/home/home_tab.dart';
import 'package:agridoc/views/onboarding/login.dart';
import 'package:agridoc/views/onboarding/select_language.dart';
import 'package:agridoc/views/onboarding/signup.dart';
import 'package:agridoc/views/onboarding/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheLanguage.init();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleBloc()
            ..add(ChangeLocaleInfo(locale: CacheLanguage.getLanguage())),
        ),
        BlocProvider(
          create: (context) => AuthBloc()..add(CheckAuth()),
        ),
      ],
      child: BlocListener<AuthBloc, AuthBlocState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Get.offAndToNamed('/home');
          }
        },
        child: BlocBuilder<LocaleBloc, LocaleState>(
          builder: (context, state) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              initialRoute: '/splash',
              title: Languages.of(context).appName,
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case '/splash':
                    return MaterialPageRoute(builder: (_) => SplashScreen());

                  case '/home':
                    return MaterialPageRoute(builder: (_) => HomeTabPage());

                  case '/login':
                    return MaterialPageRoute(builder: (_) => LoginPage());

                  case '/signup':
                    return MaterialPageRoute(builder: (_) => SignUpPage());

                  case '/error':
                    return MaterialPageRoute(builder: (_) => ErrorScreen());

                  default:
                    return MaterialPageRoute(builder: (_) => LoginPage());
                }
              },
            );
          },
        ),
      ),
    );
  }
}
