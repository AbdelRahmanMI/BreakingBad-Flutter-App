import 'package:breakingbad_project/data/models/language_constants.dart';
import 'package:breakingbad_project/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/auth_bloc/auth_bloc.dart';
import 'business_logic/auth_bloc/auth_event.dart';
import 'business_logic/auth_bloc/auth_state.dart';
import 'data/repository/auth_repositories.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthBloc>(
      create: (context) {
        return AuthBloc(AuthInitial(), userRepository)..add(AppStarted());
      },
      child: const BreakinBadApp(),
    ),
  );
}

class BreakinBadApp extends StatefulWidget {
  const BreakinBadApp({Key? key}) : super(key: key);

  @override
  State<BreakinBadApp> createState() => _BreakinBadAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _BreakinBadAppState? state =
        context.findAncestorStateOfType<_BreakinBadAppState>();
    state?.setLocale(newLocale);
  }
}

class _BreakinBadAppState extends State<BreakinBadApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  @override
  void didChangeDependencies() {
    getLocale().then((locale) => setLocale(locale));
    super.didChangeDependencies();
  }
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      onGenerateRoute: appRouter.generateRote,
    );
  }
}
