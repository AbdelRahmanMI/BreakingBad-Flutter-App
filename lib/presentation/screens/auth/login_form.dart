import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/login_bloc/login_bloc.dart';
import '../../../business_logic/login_bloc/login_event.dart';
import '../../../business_logic/login_bloc/login_state.dart';
import '../../../constants/colors.dart';
import '../../../data/repository/auth_repositories.dart';

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;

  const LoginForm({Key? key, required this.userRepository}) : super(key: key);


  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    widget.userRepository;

    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(email: _usernameController.text, password: _passwordController.text,),);
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login failed."),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 80.0),
            child: Form(
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.only(bottom: 20.0, top: 40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("LogIn to See BreakingBad Actors", style: TextStyle(
                              color: MyColors.mGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0
                          ),),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("Breaking Bad ", style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.black38
                          ),)
                        ],
                      )
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    style: const TextStyle(
                        fontSize: 14.0,
                        color: MyColors.titleColor,
                        fontWeight: FontWeight.bold),
                    controller: _usernameController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(EvaIcons.emailOutline, color: Colors.black26),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(30.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColors.mainColor),
                          borderRadius: BorderRadius.circular(30.0)),
                      contentPadding: const EdgeInsets.only(
                          left: 10.0, right: 10.0),
                      labelText: "E-Mail",
                      hintStyle: const TextStyle(
                          fontSize: 12.0,
                          color: MyColors.grey,
                          fontWeight: FontWeight.w500),
                      labelStyle: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    autocorrect: false,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    style: const TextStyle(
                        fontSize: 14.0,
                        color: MyColors.titleColor,
                        fontWeight: FontWeight.bold),
                    controller: _passwordController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      prefixIcon: const Icon(EvaIcons.lockOutline, color: Colors.black26,),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(30.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColors.mainColor),
                          borderRadius: BorderRadius.circular(30.0)),
                      contentPadding: const EdgeInsets.only(
                          left: 10.0, right: 10.0),
                      labelText: "Password",
                      hintStyle: const TextStyle(
                          fontSize: 12.0,
                          color: MyColors.grey,
                          fontWeight: FontWeight.w500),
                      labelStyle: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    autocorrect: false,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                        child: const Text("Forget password?", style: TextStyle(
                            color: Colors.black45,
                            fontSize: 12.0
                        ),),
                        onTap: () {

                        }
                    ),),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                            height: 45,
                            child: state is LoginLoading ?
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          height: 25.0,
                                          width: 25.0,
                                          child: CupertinoActivityIndicator(),
                                        )
                                      ],
                                    ))
                              ],
                            ) :
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: MyColors.mainColor,
                                onSurface: MyColors.mainColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),

                                onPressed: _onLoginButtonPressed,
                                child: const Text("LOG IN", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.white))
                            )
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Or connect using", style: TextStyle(
                          color: Colors.black26,
                          fontSize: 12.0
                      ),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 180.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF385c8e),
                            onSurface: MyColors.mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),

                            onPressed: _onLoginButtonPressed,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(EvaIcons.facebook, color: Colors.white,),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text("Facebook", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.white)),
                              ],
                            )
                        ),
                      ),
                      SizedBox(
                        width: 180.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFf14436),
                            onSurface: MyColors.mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(EvaIcons.google, color: Colors.white,),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text("Google", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.white)),
                              ],
                            )
                        ),
                      ),

                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(color: MyColors.grey),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 5.0),
                              ),
                              GestureDetector(
                                  onTap: () {

                                  },
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(
                                        color: MyColors.mainColor,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}