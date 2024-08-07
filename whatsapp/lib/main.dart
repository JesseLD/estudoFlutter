// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:whatsapp/firebase_options.dart';
import 'package:whatsapp/routes/route_generator.dart';
import 'package:whatsapp/screens/app_loading.dart';
import 'package:whatsapp/screens/language_selector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  final localeCode = prefs.getString('lang') ?? 'en';

  runApp(MyApp(initialLocale: localeCode));
}

class MyApp extends StatefulWidget {
  final String initialLocale;
  const MyApp({
    super.key,
    required this.initialLocale,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('en');

  void setLocale(Locale value) async {
    setState(() {
      _locale = value;
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', value.languageCode);
  }

  void _navigateToHomeScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final isLogged = await prefs.getBool('is_logged');
    if (isLogged == null || !isLogged) {
      Navigator.pushNamedAndRemoveUntil(
          context, "/language_select", (route) => false);
      return;
    }

    Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
  }

  // void _loadLocale() async {
  //   final String? langCode = await SharedPreferencesService.getString("langCode");
  //   if (langCode != null) {
  //     setState(() {
  //       _locale = Locale(langCode);
  //     });
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _locale = Locale(widget.initialLocale);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      title: 'Whatsapp',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: AppLoading(),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
      routes: {
        "/language_select": (context) => LanguageSelect(setLocale: setLocale),
      },
    );
  }
}
