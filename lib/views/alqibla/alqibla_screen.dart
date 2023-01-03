import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:provider/provider.dart';
import 'package:seraty/controllers/app_controller.dart';
import 'package:seraty/utilites/themedata.dart';
import 'package:seraty/utilites/loading_indicator.dart';
import 'package:seraty/views/alqibla/alqibla_compass.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AlQiblaScreen extends StatefulWidget {
  static const String routeName = "qibla-screen";

  const AlQiblaScreen({Key? key}) : super(key: key);

  @override
  State<AlQiblaScreen> createState() => _AlQiblaScreenState();
}

class _AlQiblaScreenState extends State<AlQiblaScreen> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  late AppController provider = Provider.of<AppController>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).qibla,
            style: const TextStyle(
              color: ThemeDataProvider.textDarkThemeColor,
              fontSize: 22,
              fontFamily: 'Cairo',
            ),
          ),
          centerTitle: true,
          backgroundColor: ThemeDataProvider.mainAppColor),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: MediaQuery.of(context).size.width > 1000
                  ? provider.isDarkTheme()
                      ? const AssetImage(
                          ThemeDataProvider.backgroundDarkWeb)
                      : const AssetImage(
                          ThemeDataProvider.backgroundLightWeb)
                  : provider.isDarkTheme()
                      ? const AssetImage(ThemeDataProvider.backgroundDark)
                      : const AssetImage(
                          ThemeDataProvider.backgroundLight),
              // opacity: 0.4,
              fit: BoxFit.cover),
        ),
        child: FutureBuilder(
          future: _deviceSupport,
          builder: (_, AsyncSnapshot<bool?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingIndicator();
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );
            }

            if (snapshot.data!) {
              return const AlQiblahCompass();
            } else {
              return const Center(child: Text("UnExpected Error!!"));
            }
          },
        ),
      ),
    );
  }
}
