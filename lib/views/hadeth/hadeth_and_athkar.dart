
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seraty/utilites/themedata.dart';
import 'package:seraty/views/athkar/athkar_screen.dart';
import 'package:seraty/views/hadeth/hadeth_screen.dart';

import '../../controllers/app_controller.dart';

class HadethAndAthkarScreen extends StatefulWidget {
  static const String routeName = "azkar&hadeth-screen";

  const HadethAndAthkarScreen({Key? key}) : super(key: key);

  @override
  State<HadethAndAthkarScreen> createState() => _HadethAndAthkarScreenState();
}

class _HadethAndAthkarScreenState extends State<HadethAndAthkarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late AppController provider = Provider.of<AppController>(context);

  List<Tab> tabsAr = <Tab>[
    const Tab(text: "الأحاديث"),
    const Tab(text: "الأذكار"),
  ];

  List<Tab> tabsEn = <Tab>[
    const Tab(text: "Hadith"),
    const Tab(text: "Azkar"),
  ];

  List<Widget> widgets = <Widget>[
    const HadethScreen(),
    const AthkarScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: widgets.length);
  }

  late bool isRTL;
  var surahsNames = [];
  var surahsVerses = [];

  @override
  Widget build(BuildContext context) {
    final TextDirection currentDirection = Directionality.of(context);
    isRTL = currentDirection == TextDirection.rtl;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
              // opacity: 0.4,
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.10,
              decoration: const BoxDecoration(
                  color: ThemeDataProvider.mainAppColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  )),
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TabBar(
                      indicatorColor: ThemeDataProvider.textDarkThemeColor,
                      labelColor: ThemeDataProvider.textDarkThemeColor,
                      labelStyle: const TextStyle(
                        fontSize: 22,
                        fontFamily: 'Cairo',
                      ),
                      indicatorSize: TabBarIndicatorSize.label,
                      controller: _tabController,
                      tabs: provider.isEnglish() ? tabsEn : tabsAr,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child:
                    TabBarView(controller: _tabController, children: widgets))
          ],
        ),
      ),
    );
  }
}
