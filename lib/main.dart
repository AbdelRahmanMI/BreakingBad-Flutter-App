import 'package:breakingbad_project/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/auth_bloc/auth_bloc.dart';
import 'business_logic/auth_bloc/auth_event.dart';
import 'business_logic/auth_bloc/auth_state.dart';
import 'data/repository/auth_repositories.dart';

void main() {
  //BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthBloc>(
      create: (context) {
        return AuthBloc(AuthInitial() , userRepository)
          ..add(AppStarted());
      },
      child: BreakinBadApp(),
    ),
  );
}

class BreakinBadApp extends StatelessWidget {
   BreakinBadApp({Key? key}) : super(key: key);

    final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRote,
    );
  }
}