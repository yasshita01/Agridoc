import 'package:agridoc/blocs/locale/locale_bloc.dart';
import 'package:agridoc/languages/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectLanguage extends StatefulWidget {
  SelectLanguage({Key? key}) : super(key: key);

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  late LocaleBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<LocaleBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  Languages.of(context).appName,
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
              ),
              BlocBuilder<LocaleBloc, LocaleState>(
                builder: (context, state) {
                  if (state is ChangeLocale) {
                    return Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pick Language",
                            style: TextStyle(
                              fontSize: 26,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ListTile(
                            title: Text(
                              "English",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            selected: state.locale.languageCode == 'en'
                                ? true
                                : false,
                            onTap: () =>
                                bloc.add(ChangeLocaleInfo(locale: 'en')),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ListTile(
                            title: Text(
                              "Hindi",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            selected: state.locale.languageCode == 'hn'
                                ? true
                                : false,
                            onTap: () =>
                                bloc.add(ChangeLocaleInfo(locale: 'hn')),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              },
                              child: Text("Next")),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
