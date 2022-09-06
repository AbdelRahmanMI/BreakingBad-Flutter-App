import 'package:breakingbad_project/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BreakinBadApp(appRouter: AppRouter(),));
}

class BreakinBadApp extends StatelessWidget {
  const BreakinBadApp({Key? key, required this.appRouter}) : super(key: key);

    final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRote,
    );
  }
}