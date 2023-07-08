import 'dart:developer';

import 'package:agridoc/blocs/auth_bloc/auth_bloc_bloc.dart';
import 'package:agridoc/languages/language.dart';
import 'package:agridoc/utils/text_sizes.dart';
import 'package:agridoc/widgets/dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final AuthBloc _authBloc;

  TextEditingController _email = TextEditingController();

  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  RxBool showPass = false.obs;

  @override
  void initState() {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthBlocState>(
          listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
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
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 0),
                      child: TextFormField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          label: Text(
                            "Email",
                            style: poppinsFont,
                          ),
                        ),
                        validator: (val) {
                          if (!GetUtils.isEmail(val!.trim())) {
                            return "Enter valid email";
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 0),
                      child: Obx(
                        () => TextFormField(
                          controller: _password,
                          obscureText: !showPass.value,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            suffix: GestureDetector(
                              onTap: () {
                                showPass.value = !showPass.value;
                              },
                              child: Icon(
                                showPass.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                            label: Text(Languages.of(context).password,
                                style: poppinsFont),
                          ),
                          validator: (val) {
                            if (val!.length < 6) {
                              return "password should be of minimum 6 characters";
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<AuthBloc, AuthBlocState>(
                      bloc: _authBloc,
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _authBloc.add(Login(
                                  password: _password.text,
                                  phone: _email.text));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              maximumSize: const Size(double.infinity, 50)),
                          child: Text(
                            "Login",
                            style: poppinsFont.copyWith(fontSize: 18),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                        text: TextSpan(
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      children: [
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: Text(
                              ' ${Languages.of(context).signUp}',
                              style: TextStyle(),
                            ),
                          ),
                        )
                      ],
                      text: "${Languages.of(context).needAccount} ?",
                    )),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
