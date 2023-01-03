import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seraty/utilites/themedata.dart';
import 'package:seraty/views/hadeth/hadeth_and_athkar.dart';
import 'package:seraty/views/information/information_screen.dart';
import 'package:seraty/views/alqibla/alqibla_screen.dart';
import 'package:seraty/views/alquran/alquran_screen.dart';
import 'package:seraty/views/quranRadio/quran_radio_screen.dart';
import 'package:seraty/views/Mesbaha/mesbaha_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../controllers/app_controller.dart';

class LandingScreen extends StatefulWidget {
  static const String routeName = "landing-screen";

  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppController>(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: MediaQuery.of(context).size.width > 1000
                ? provider.isDarkTheme()
                    ? const AssetImage(ThemeDataProvider.backgroundDarkWeb)
                    : const AssetImage(ThemeDataProvider.backgroundLightWeb)
                : provider.isDarkTheme()
                    ? const AssetImage(ThemeDataProvider.backgroundDark)
                    : const AssetImage(ThemeDataProvider.backgroundLight),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/onboarding1.png'),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                provider.isEnglish() ? 'Seraty' : 'صراتــي',
                style: TextStyle(
                  color: provider.isDarkTheme() ? Colors.white : Colors.black,
                  fontSize: 30,
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                children: [
                  CustomCard(
                    text: AppLocalizations.of(context).title,
                    onTap: () {
                      Navigator.of(context).pushNamed(AlQuranScreen.routeName);
                    },
                  ),
                  CustomCard(
                    text: AppLocalizations.of(context).hadith,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(HadethAndAthkarScreen.routeName);
                    },
                  ),
                  CustomCard(
                    text: AppLocalizations.of(context).tasbeeh,
                    onTap: () {
                      Navigator.of(context).pushNamed(MesbahaScreen.routeName);
                    },
                  ),
                  CustomCard(
                    text: AppLocalizations.of(context).qibla,
                    onTap: () {
                      Navigator.of(context).pushNamed(AlQiblaScreen.routeName);
                    },
                  ),
                  CustomCard(
                    text: AppLocalizations.of(context).radio,
                    onTap: () {
                      Navigator.of(context).pushNamed(RadioScreen.routeName);
                    },
                  ),
                  CustomCard(
                    text: provider.isEnglish() ? 'Settings' : 'الإعدادات',
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(InformationScreen.routeName);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const CustomCard({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppController>(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: (MediaQuery.of(context).size.width - 60) / 3,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              width: 2,
              color: Colors.grey.shade300,
            ),
          ),
          elevation: 8,
          shadowColor: provider.isDarkTheme() ? Colors.white : Colors.black,
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
