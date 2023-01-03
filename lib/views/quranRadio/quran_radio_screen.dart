import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:seraty/utilites/themedata.dart';
import 'package:seraty/utilites/loading_indicator.dart';
import 'package:radio_player/radio_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../controllers/app_controller.dart';
import '../../controllers/radio_controller.dart';

class RadioScreen extends StatefulWidget {
  static const String routeName = "radio-screen";

  const RadioScreen({Key? key}) : super(key: key);

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  final RadioPlayer _radioPlayer = RadioPlayer();
  bool isPlaying = false;
  List<String>? metadata;

  late Future<RadioResponse> radioStations;
  late String radioUrl;

  static int index = 0;
  String arabicRadio = "https://api.mp3quran.net/radios/radio_arabic.json";
  String englishRadio = "https://api.mp3quran.net/radios/radio_english.json";
  @override
  void initState() {
    super.initState();
    play();
  }

  late AppController provider = Provider.of<AppController>(context);

  @override
  Widget build(BuildContext context) {
    final TextDirection currentDirection = Directionality.of(context);
    final bool isLTR = currentDirection == TextDirection.ltr;
    radioStations =
        isLTR ? getRadioStations(englishRadio) : getRadioStations(arabicRadio);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).radio,
          style: const TextStyle(
            color: ThemeDataProvider.textDarkThemeColor,
            fontSize: 22,
            fontFamily: 'Cairo',
          ),
        ),
        centerTitle: true,
        backgroundColor: ThemeDataProvider.mainAppColor,
      ),
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
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: FutureBuilder<RadioResponse>(
                  future: radioStations,
                  builder: (context, stations) {
                    if (stations.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 50),
                          Text(
                            AppLocalizations.of(context).radio,
                            style: TextStyle(
                              color: provider.isDarkTheme()
                                  ? ThemeDataProvider.textDarkThemeColor
                                  : ThemeDataProvider.textLightThemeColor,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width * 0.95,
                              child: Lottie.asset('assets/images/radio.json')),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          
                          Text(
                            'إذاعة متنوعة للقرآن الكريم',
                            style: TextStyle(
                              color: provider.isDarkTheme()
                                  ? ThemeDataProvider.textDarkThemeColor
                                  : ThemeDataProvider.textLightThemeColor,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 50,
                              ),
                            
                              Expanded(
                                child: CircleAvatar(
                                  maxRadius: 30,
                                  minRadius: 20,
                                  backgroundColor:
                                      ThemeDataProvider.mainAppColor,
                                  child: IconButton(
                                    icon: Icon(
                                      isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      size: 30,
                                      color:
                                          ThemeDataProvider.textDarkThemeColor,
                                    ),
                                    onPressed: () {
                                      isPlaying
                                          ? _radioPlayer.pause()
                                          : _radioPlayer.play();
                                    },
                                  ),
                                ),
                              ),
                             
                              const SizedBox(
                                width: 50,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      );
                    } else if (stations.hasError) {
                      return const Text("Error loading radio");
                    }
                    return const LoadingIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void play() {
    _radioPlayer.stateStream.listen((value) {
      setState(() {
        isPlaying = value;
      });
    });
    _radioPlayer.setChannel(
      title: "Radio Quran",
      url: "https://Qurango.net/radio/mix",
      imagePath: "assets/images/time.jpg",
    );
  }

  void next(String radioStation, int length) {
    index == length ? index : index++;
    _radioPlayer.setChannel(
      title: "Radio Quran",
      url: radioStation,
      imagePath: "assets/images/time.jpg",
    );

    setState(() {});
  }

  void previous(String radioStation) {
    index == 0 ? index : index--;
    _radioPlayer.setChannel(
      title: "Radio Quran",
      url: radioStation,
      imagePath: "assets/images/time.jpg",
    );
    setState(() {});
  }
}

String convertUTF8(String text) {
  List<int> bytes = text.toString().codeUnits;
  return utf8.decode(bytes);
}
