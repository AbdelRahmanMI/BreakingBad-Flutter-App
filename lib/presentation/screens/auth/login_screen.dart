import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/auth_bloc/auth_bloc.dart';
import '../../../business_logic/login_bloc/login_bloc.dart';
import '../../../data/repository/auth_repositories.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository userRepository;

  const LoginScreen({Key? key, required this.userRepository}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
         return LoginBloc(
           authenticationBloc: BlocProvider.of<AuthBloc>(context),
           userRepository: userRepository,
         );
        },
        child: LoginForm(userRepository: userRepository,),
      ),
    );
  }
}