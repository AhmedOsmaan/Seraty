import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:seraty/controllers/app_controller.dart';
import 'package:seraty/utilites/preferences.dart';
import 'package:seraty/utilites/themedata.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationScreen extends StatefulWidget {
  static const String routeName = "infoview";

  const InformationScreen({Key? key}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  ArabicNumbers arabicNumber = ArabicNumbers();

  List<String> lovedNames = [];

  @override
  void initState() {
    lovedNames = Preferences.getNamesPrefrences() ??
        [
          ' جدي لأمي الغالي / علي علي عبد العزيز',
          "جدتي لأمي الغاليه / إنصاف عبد المجيد",
          'خالي الحبيب اللواء / حسام علي علي',
          'جدي لأبي الحاج/ محمود عثمان',
          'جدتي لأبي الحاجه / فاطمه الالموشي',
          'جد زوجتي الاستاذ / الجبالي السيد عبد الله',
          'جدة زوجتي الحاجه / نظيمه عبد الفتاح السيد',
          'جدي الاستاذ / أحمد شحاته',
          'جدتي الحاجه / نوال شحاته',
          'والد صهري الاستاذ / شوقي زغلول عبده',
          ':والغالين من عائلتي و معارفي',
          'الشيخ / مصطفي عبد الهادي',
          'الغالي الأستاذ / ناصر علي عبد المجيد',
          'الغاليه الاستاذه / ايناس رفعت',
          'الحاج/ السيد عبدالله ابو جبل',
          'الحاج / عبد الفتاح السيد ابو جبل',
          'الحاج / علي عبد العزيز ابو جبل',
          'الحاج / عبد المجيد عبد العزيز',
          'الاستاذ / جمال السيد عبدالله',
          'الاستاذ / سمير السيد عبد الله',
          'الاستاذ / امير السيد عبد الله',
          'الاستاذ / عبد الفتاح السيد عبد الله',
          'الاستاذ / عاطف السيد عبد الله',
          'الاستاذ / فهيم علي عبد العزيز',
          'الاستاذ / محمد علي عبد العزيز',
          'الاستاذ / سعد علي عبد العزيز',
          'الاستاذ / عبد الغفار علي عبد العزيز',
          'الاستاذ / بدوي علي عبد الغفار',
          'الاستاذ / اسماعيل عبد المجيد',
          'الاستاذ / عبد الحكيم عبد المجيد',
          'الحاجه / السيده علي العلامي',
          'الحاجه / هند',
          'الحاجه / نوال السيد عبد الله',
          'الحاجه / راويه السيد عبد الله',
          'الحاجه / انعام عبد المجيد',
          'الحاجه / الطاف عبد المجيد',
          'الحاجه / سنيه علي عبد العزيز',
          'الحاجه / نبيه علي عبد العزيز',
          'الحاجه / بديعه علي عبد العزيز',
          'الحاجه / سيده السايح',
          'الحاجه / نوال ام علي'
        ];
    super.initState();
  }

  // List names = [
  //   "جدي الغالي الأستاذ علي علي عبد العزيز",
  //   'جدتي الغالية الأستاذة إنصاف عبد المجيد',
  //   ' خالي الحبيب اللواء حسام علي علي',
  //   'جدي الحاج محمود عثمان',
  //   'جدتي الحاجه فاطمة الألموشي',
  //   'جدي الأستاذ الجبالي السيد عبدالله',
  //   'جدتي الحاجه نظيمه عبد الفتاح السيد',
  //   'جدي الحاج أحمد شحاته',

  // ];

  TextEditingController namesController = TextEditingController();

  _launchURL(int i) async {
    List<String> urls = [
      'https://github.com/AhmedOsmaan',
      'https://www.facebook.com/Mr.A.Osman',
      "https://wa.me/201016649685",
    ];
    // ignore: deprecated_member_use
    if (await canLaunch(urls[i])) {
      // ignore: deprecated_member_use
      await launch(urls[i]);
    } else {
      throw 'Could not launch $urls[i]';
    }
  }

  @override
  Widget build(BuildContext context) {
    late AppController provider = Provider.of<AppController>(context);

    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeDataProvider.mainAppColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: MediaQuery.of(context).size.width > 1000
                  ? provider.isDarkTheme()
                      ? const AssetImage(
                          ThemeDataProvider.backgroundDarkWeb,
                        )
                      : const AssetImage(
                          ThemeDataProvider.backgroundLightWeb,
                        )
                  : provider.isDarkTheme()
                      ? const AssetImage(
                          ThemeDataProvider.backgroundDark,
                        )
                      : const AssetImage(ThemeDataProvider.backgroundLight),
              // opacity: 0.4,
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: const BoxDecoration(
                color: ThemeDataProvider.mainAppColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Center(
                      child: Image.asset(
                        "assets/images/quran.png",
                        fit: BoxFit.cover,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "الَّذِينَ يَعْمَلُونَ الصَّالِحَاتِ أَنَّ لَهُمْ أَجْرًا كَبِيرًا",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            settings(context),
            const SizedBox(height: 10),
            about(context),
            const SizedBox(height: 10),
            developers(context),
            const SizedBox(height: 10),
            gifted(context),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                provider.isEnglish()
                    ? "Ahmed Osman 2022 © All Rights Reserved"
                    : arabicNumber
                        .convert("جميع الحقوق محفوظه © أحمد عثمان 2022"),
                style: TextStyle(
                  fontSize: 14,
                  color: provider.isDarkTheme()
                      ? ThemeDataProvider.textDarkThemeColor
                      : ThemeDataProvider.textLightThemeColor,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                provider.isEnglish()
                    ? "1.0.0 version"
                    : arabicNumber.convert("1.0.0 إصدار"),
                style: TextStyle(
                  fontSize: 12,
                  color: provider.isDarkTheme()
                      ? ThemeDataProvider.textDarkThemeColor
                      : ThemeDataProvider.textLightThemeColor,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget developers(BuildContext context) {
    late AppController provider = Provider.of<AppController>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: ExpansionTile(
        iconColor: ThemeDataProvider.mainAppColor,
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 245, 241, 241),
          ),
          child: const Center(
            child: Icon(
              Icons.person,
              color: ThemeDataProvider.mainAppColor,
              size: 24,
            ),
          ),
        ),
        title: Text(
          provider.isEnglish() ? "Developers" : "المطورون",
          style: TextStyle(
            fontSize: 24,
            color: provider.isDarkTheme()
                ? ThemeDataProvider.textDarkThemeColor
                : ThemeDataProvider.textLightThemeColor,
          ),
        ),
        children: <Widget>[
          Column(
            mainAxisAlignment: provider.isEnglish()
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Text(
                      provider.isEnglish() ? "Ahmed Osman" : "أحمد عثمان",
                      style: const TextStyle(
                          fontSize: 24,
                          color: ThemeDataProvider.mainAppColor),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        provider.isEnglish()
                            ? ". Flutter Developer"
                            : ". مبرمج تطبيقات",
                        style: TextStyle(
                          fontSize: 16,
                          
                          color: provider.isDarkTheme()
                              ? ThemeDataProvider.textDarkThemeColor
                              : ThemeDataProvider.textLightThemeColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  textAlign: TextAlign.justify,
                  provider.isEnglish()
                      ? 'Experienced Information Technology Specialist with a demonstrated history of working in Mobile Application Development, IT Service Management'
                      : "متخصص في تكنولوجيا المعلومات من ذوي الخبرة ولدي تاريخ مثبت في العمل في تطوير تطبيقات الهاتف المحمول، وإدارة خدمات تكنولوجيا المعلومات",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.normal,
                        color: provider.isDarkTheme()
                            ? ThemeDataProvider.textDarkThemeColor
                            : ThemeDataProvider.textLightThemeColor,
                      ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      _launchURL(0);
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.github,
                      color: provider.isDarkTheme()
                          ? ThemeDataProvider.textDarkThemeColor
                          : const Color(0xff171515),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _launchURL(2);
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.whatsapp,
                      color: Color(0xff25d366),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _launchURL(1);
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.facebook,
                      color: Color(0xff3b5998),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget about(BuildContext context) {
    late AppController provider = Provider.of<AppController>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: ExpansionTile(
        iconColor: ThemeDataProvider.mainAppColor,
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 245, 241, 241),
          ),
          child: const Center(
            child: Icon(
              Icons.info_outline,
              color: ThemeDataProvider.mainAppColor,
              size: 24,
            ),
          ),
        ),
        title: Text(
          provider.isEnglish() ? "About" : "عن التطبيق",
          style: TextStyle(
            fontSize: 24,
            color: provider.isDarkTheme()
                ? ThemeDataProvider.textDarkThemeColor
                : ThemeDataProvider.textLightThemeColor,
          ),
        ),
        children: <Widget>[
          Column(
            mainAxisAlignment: provider.isEnglish()
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  provider.isEnglish() ? "Seraty" : " صراتـي",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: provider.isDarkTheme()
                        ? ThemeDataProvider.textDarkThemeColor
                        : ThemeDataProvider.textLightThemeColor,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  textAlign: TextAlign.justify,
                  provider.isEnglish()
                      ? 'The application of the Seraty helps you to read the surahs and verses wherever you go and remember the prayer times with determining the direction of the qiblah. There is also our Holy Qur’an radio station. We also give you the possibility to glorify God and display hadiths and remembrances.'
                      : "تطبيق صراتي يساعدك على قرآة السور والآيات أينما ذهبت وتذكر مواعيد الصلاة مع تحديد اتجاه القبلة كما أنه يحوي إذاعة القرآن الكريم الخاصة بنا كما يتيح لكم امكانية تسبيح الله وعرض الأحاديث والأذكار",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.normal,
                        color: provider.isDarkTheme()
                            ? ThemeDataProvider.textDarkThemeColor
                            : ThemeDataProvider.textLightThemeColor,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget settings(BuildContext context) {
    late AppController provider = Provider.of<AppController>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: ExpansionTile(
        iconColor: ThemeDataProvider.mainAppColor,
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 245, 241, 241),
          ),
          child: const Center(
            child: Icon(
              Icons.settings,
              color: ThemeDataProvider.mainAppColor,
              size: 24,
            ),
          ),
        ),
        title: Text(
          provider.isEnglish() ? "Settings" : "الاعدادات",
          style: TextStyle(
            fontSize: 24,
            color: provider.isDarkTheme()
                ? ThemeDataProvider.textDarkThemeColor
                : ThemeDataProvider.textLightThemeColor,
          ),
        ),
        children: <Widget>[
          Column(
            mainAxisAlignment: provider.isEnglish()
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "كَلا إِنَّ مَعِيَ رَبِّي سَيَهْدِينِ ",
                  style: TextStyle(
                    fontSize: Provider.of<AppController>(context, listen: true)
                        .valueHolder
                        .toDouble(),
                    fontWeight: FontWeight.w400,
                    // fontFamily: "quranFont",
                    color: provider.isDarkTheme()
                        ? ThemeDataProvider.textDarkThemeColor
                        : ThemeDataProvider.textLightThemeColor,
                  ),
                ),
              ),
              Slider(
                  activeColor: ThemeDataProvider.mainAppColor,
                  value: Provider.of<AppController>(context, listen: true)
                      .valueHolder
                      .toDouble(),
                  min: 14,
                  max: 44,
                  label:
                      '${Provider.of<AppController>(context, listen: true).valueHolder.round()}',
                  onChanged: (double newValue) {
                    setState(() {
                      Provider.of<AppController>(context, listen: false)
                          .saveFontSize(newValue.round());
                    });
                  },
                  semanticFormatterCallback: (double newValue) {
                    return '${newValue.round()}';
                  }),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        provider.isEnglish() ? "Language" : "اللغه",
                        style: TextStyle(
                            fontSize: 20,
                            color: provider.isDarkTheme()
                                ? ThemeDataProvider.textDarkThemeColor
                                : ThemeDataProvider.textLightThemeColor),
                      ),
                      CupertinoSwitch(
                        activeColor: ThemeDataProvider.mainAppColor,
                        value: provider.isEnglish() ? true : false,
                        onChanged: (value) {
                          setState(() {
                            provider.isEnglish()
                                ? provider.changeLanguage('ar')
                                : provider.changeLanguage('en');
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        provider.isEnglish() ? "Dark Mode" : "الوضع الليلي",
                        style: TextStyle(
                            fontSize: 20,
                            color: provider.isDarkTheme()
                                ? ThemeDataProvider.textDarkThemeColor
                                : ThemeDataProvider.textLightThemeColor),
                      ),
                      CupertinoSwitch(
                        value: provider.isDarkTheme() ? true : false,
                        activeColor: ThemeDataProvider.mainAppColor,
                        onChanged: (value) {
                          setState(() {
                            provider.isDarkTheme()
                                ? provider.changeToLightTheme()
                                : provider.changeToDarkTheme();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget gifted(BuildContext context) {
    late AppController provider = Provider.of<AppController>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: ExpansionTile(
        iconColor: ThemeDataProvider.mainAppColor,
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 245, 241, 241),
          ),
          child: const Center(
            child: Icon(
              Icons.handshake_outlined,
              color: ThemeDataProvider.mainAppColor,
              size: 24,
            ),
          ),
        ),
        title: Text(
          provider.isEnglish() ? "Gifted to" : "إهداء إلي",
          style: TextStyle(
            fontSize: 24,
            color: provider.isDarkTheme()
                ? ThemeDataProvider.textDarkThemeColor
                : ThemeDataProvider.textLightThemeColor,
          ),
        ),
        children: <Widget>[
          Column(
            mainAxisAlignment: provider.isEnglish()
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  provider.isEnglish()
                      ? "To those who we miss the most\n"
                      : "إلي من ذهبت أجزاء من أرواحنا وقت أن ذهبوا\n",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    // fontFamily: "quranFont",
                    color: provider.isDarkTheme()
                        ? ThemeDataProvider.textDarkThemeColor
                        : ThemeDataProvider.textLightThemeColor,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  textAlign: TextAlign.center,
                  lovedNames.join('\n'),
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.normal,
                        color: provider.isDarkTheme()
                            ? ThemeDataProvider.textDarkThemeColor
                            : ThemeDataProvider.textLightThemeColor,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  onSubmitted: (value) async {
                    lovedNames.add(namesController.text);
                    await Preferences.savenamesPreference(lovedNames);
                  },
                  controller: namesController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: provider.isEnglish()
                        ? 'add your loved ones'
                        : 'أضف أحبابك وشاركنا الثواب',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeDataProvider.mainAppColor,
                ),
                onPressed: () async {
                  lovedNames.add(namesController.text);
                  await Preferences.savenamesPreference(lovedNames);
                },
                child: const Text('Add'),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
