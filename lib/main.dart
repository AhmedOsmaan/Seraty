import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:provider/provider.dart';
import 'package:seraty/controllers/app_controller.dart';
import 'package:seraty/utilites/preferences.dart';
import 'package:seraty/utilites/themedata.dart';
import 'package:seraty/views/hadeth/hadeth_and_athkar.dart';
import 'package:seraty/views/information/information_screen.dart';
import 'package:seraty/views/landing_screen.dart';
import 'package:seraty/views/alqibla/alqibla_screen.dart';
import 'package:seraty/views/alquran/alquran_screen.dart';
import 'package:seraty/views/quranRadio/quran_radio_screen.dart';
import 'package:seraty/views/setting/setting_screen.dart';
import 'package:seraty/views/Mesbaha/mesbaha_screen.dart';
import 'package:seraty/views/widgets/athkar_and_hadeth_view.dart';
import 'package:seraty/views/widgets/content_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'views/onBoarding/on_boarding_screen.dart';

int? initScreen;

Future<void> main(context) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (buildContext) => AppController(),
        builder: (buildContext, widget) {
          final provider = Provider.of<AppController>(buildContext);
          provider.themeMode = Preferences.getThemePreference();
          return MaterialApp(
            themeMode: provider.themeMode,
            darkTheme: ThemeDataProvider.darkTheme,
            theme: ThemeDataProvider.lightTheme,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale.fromSubtags(languageCode: Preferences.getLanguage()),
            debugShowCheckedModeBanner: false,
            initialRoute: initScreen == 0 || initScreen == null
                ? onBoardingPage.routeName
                : LandingScreen.routeName,
            routes: {
              onBoardingPage.routeName: (context) => const onBoardingPage(),
              InformationScreen.routeName: (context) =>
                  const InformationScreen(),
              LandingScreen.routeName: (context) => const LandingScreen(),
              AlQuranScreen.routeName: (context) => const AlQuranScreen(),
              ContentView.routeName: (context) => ContentView(),
              HadethAndAthkarScreen.routeName: (context) =>
                  const HadethAndAthkarScreen(),
              AzkarandHadithView.routeName: (context) => AzkarandHadithView(),
              MesbahaScreen.routeName: (context) => const MesbahaScreen(),
              RadioScreen.routeName: (context) => const RadioScreen(),
              AlQiblaScreen.routeName: (context) => const AlQiblaScreen(),
              SettingScreen.routeName: (context) => const SettingScreen(),
            },
          );
        });
  }
}
