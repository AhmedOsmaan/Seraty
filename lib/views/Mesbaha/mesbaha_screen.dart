import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seraty/utilites/themedata.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../controllers/app_controller.dart';

class MesbahaScreen extends StatefulWidget {
  static const String routeName = "tasbeeh-screen";

  const MesbahaScreen({Key? key}) : super(key: key);

  @override
  State<MesbahaScreen> createState() => _MesbahaScreenState();
}

class _MesbahaScreenState extends State<MesbahaScreen> {
  late AppController provider = Provider.of<AppController>(context);
  String tasbeehButtonLabel = 'سبحان الله';
  int _tasbeehCounter = 0;

  void _changeTasbeehButtonDisplay() {
    if (tasbeehButtonLabel == 'سبحان الله') {
      tasbeehButtonLabel = 'الحمد لله';
    } else if (tasbeehButtonLabel == 'الحمد لله') {
      tasbeehButtonLabel = "لا إله إلا الله";
    } else if (tasbeehButtonLabel == "لا إله إلا الله") {
      tasbeehButtonLabel = 'الله اكبر';
    } else if (tasbeehButtonLabel == 'الله اكبر') {
      tasbeehButtonLabel = "لا حول ولا قوة إلا بالله";
    } else {
      tasbeehButtonLabel = 'سبحان الله';
    }
  }

  void _incrementTasbeehCounter() {
    setState(() {
      if (_tasbeehCounter == 33) {
        _tasbeehCounter = 0;
        _changeTasbeehButtonDisplay();
      } else {
        _tasbeehCounter++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).tasbeeh,
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
              fit: BoxFit.cover,),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              tasbeehButtonLabel,
              textScaleFactor: 1.5,
              style: TextStyle(
                  color: ThemeDataProvider.mainAppColor,
                  fontSize: provider.valueHolder.toDouble(),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              '$_tasbeehCounter ',
              textScaleFactor: 1.5,
              style: TextStyle(
                  color: provider.isDarkTheme() ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: provider.valueHolder.toDouble(),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            GestureDetector(
              onTap: () {
                _incrementTasbeehCounter();
              },
              child: Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                    radius: MediaQuery.of(context).size.height * 0.18,
                    backgroundColor: _tasbeehCounter.isOdd
                        ? const Color.fromARGB(255, 112, 160, 231)
                        : ThemeDataProvider.mainAppColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
