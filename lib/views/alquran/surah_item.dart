import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seraty/controllers/app_controller.dart';
import 'package:seraty/utilites/themedata.dart';
import 'package:seraty/models/surah_model.dart';
import 'package:seraty/views/widgets/content_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class SurahItem extends StatelessWidget {
  final String name, verse;
  final int fileNumber;
  final Color color;
  bool isRTL;
  SurahItem(
      {Key? key,
      required this.name,
      required this.verse,
      required this.fileNumber,
      required this.color,
      required this.isRTL})
      : super(key: key);
  double sizeNumbering = 40;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppController>(context);
    ArabicNumbers arabicNumber = ArabicNumbers();
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ContentView.routeName,
            arguments: SurahModel(name, fileNumber, true));
      },
      child: SizedBox(
        width: 70,
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: sizeNumbering,
                          height: sizeNumbering,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              arabicNumber.convert(fileNumber.toString()),
                              style: const TextStyle(
                                fontSize: 18,
                                color: ThemeDataProvider.textDarkThemeColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          height: 40,
                          child: Image.asset(
                            "assets/sName/sname_$fileNumber.png",
                            color: color,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          provider.isEnglish()
                              ? "$verse ${AppLocalizations.of(context).verse}"
                              : "${arabicNumber.convert(verse)} ${AppLocalizations.of(context).verse}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: color),
                        ),
                        Text(
                          name,
                          style: TextStyle(
                            color: provider.isDarkTheme()
                                ? ThemeDataProvider.textDarkThemeColor
                                : ThemeDataProvider.textLightThemeColor,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: provider.isDarkTheme()
                    ? Colors.white70
                    : Colors.grey.shade700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
