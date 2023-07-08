import 'package:agridoc/blocs/auth_bloc/auth_bloc_bloc.dart';
import 'package:agridoc/languages/language.dart';
import 'package:agridoc/languages/language_en.dart';
import 'package:agridoc/widgets/dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../utils/text_sizes.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  late final AuthBloc _authBloc;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  RxBool _showPass = false.obs;

  @override
  Widget build(BuildContext context) {
    _authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      body: LoaderOverlay(
        child: SafeArea(
          child: SingleChildScrollView(
            child: BlocListener<AuthBloc, AuthBlocState>(
              listener: (context, state) {
                if (state is AuthAuthenticated) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                }
              },
              child: BlocBuilder<AuthBloc, AuthBlocState>(
                bloc: _authBloc,
                builder: (context, state) {
                  return Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Align(
                        //   alignment: Alignment.topRight,
                        //   child: SizedBox(
                        //     width: MediaQuery.of(context).size.width * 0.6,
                        //     height: MediaQuery.of(context).size.height * 0.27,
                        //     child: Image.asset(
                        //       'assets/images/loginpagedesign.png',
                        //       fit: BoxFit.fill,
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            Languages.of(context).appName,
                            style: headingBold.copyWith(
                                fontSize: 26, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Your go-to app for all your gardening essentials.",
                            style: poppinsFont.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w200),
                          ),
                        ),

                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: _username,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.account_circle,
                              size: 20,
                            ),
                            label: Text(Languages.of(context).username),
                          ),
                        ),

                        TextFormField(
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              size: 20,
                            ),
                            label: Text("Email"),
                          ),
                        ),
                        Obx(
                          () => TextFormField(
                            controller: _password,
                            obscureText: !_showPass.value,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.password,
                                size: 20,
                              ),
                              suffix: GestureDetector(
                                onTap: () {
                                  _showPass.value = !_showPass.value;
                                },
                                child: Icon(
                                  _showPass.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                              label: Text(Languages.of(context).password),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        ElevatedButton(
                          onPressed: () async {
                            _authBloc.add(SignUp(
                                username: _username.text,
                                password: _password.text,
                                phone: _email.text));
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            maximumSize: const Size(double.infinity, 50),
                          ),
                          child: state is AuthLoading
                              ? showLoading(context)
                              : Text(
                                  state is AuthUnauthenticated
                                      ? Languages.of(context).signUp
                                      : "user created",
                                  style: TextStyle(fontSize: 16),
                                ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
