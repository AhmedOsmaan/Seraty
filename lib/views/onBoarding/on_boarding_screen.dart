import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:seraty/utilites/themedata.dart';
import 'package:seraty/views/landing_screen.dart';

// ignore: camel_case_types
class onBoardingPage extends StatelessWidget {
  static const String routeName = "onBoarding-screen";

  const onBoardingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'الّذِينَ آمَنُواْ وَتَطْمَئِنّ قُلُوبُهُمْ بِذِكْرِ اللّهِ أَلاَ بِذِكْرِ اللّهِ تَطْمَئِنّ الْقُلُوبُ',
          body:
              'مع تطبيق صراتي يمكنك قراءة القرآن وأذكارك اليومية في أي مكان',
          image: buildImage('assets/images/onboarding1.png'),
          decoration: buildDecoration(),
        ),
        PageViewModel(
          title: "وَقَالُواْ الْحَمْدُ للّهِ الّذِيَ أَذْهَبَ عَنّا الْحَزَنَ إِنّ رَبّنَا لَغَفُورٌ شَكُورٌ",
          body: 'حافظ علي صلاتك باستخدام مواقيت الصلاة وتحديد القبلة',
          image: buildImage('assets/images/onboarding3.jpg'),
          decoration: buildDecoration(),
        ),
        PageViewModel(
          title:
              'وَنُنَزِّلُ مِنَ الْقُرْآنِ مَا هُوَ شِفَاء وَرَحْمَةٌ لِّلْمُؤْمِنِينَ وَلاَ يَزِيدُ الظَّالِمِينَ إَلاَّ خَسَارًا',
          body:
              'أدم ذكر الله علي لسانك باستخدام المسبحة داخل التطبيق',
          image: buildImage('assets/images/onboarding2.png'),
          decoration: buildDecoration(),
        ),
      ],
      next: const Icon(
        Icons.navigate_before,
        size: 40,
        color: ThemeDataProvider.mainAppColor,
      ),
      done: const Text('Done',
          style:
              TextStyle(color: ThemeDataProvider.mainAppColor, fontSize: 20)),
      onDone: () => goToHome(context),
      showSkipButton: true,
      skip: const Text(
        'Skip',
        style: TextStyle(color: ThemeDataProvider.mainAppColor, fontSize: 20),
      ),
      onSkip: () => goToHome(context),
      dotsDecorator: getDotDecoration(),
      animationDuration: 1000,
      globalBackgroundColor: Colors.white,
      rtl: true,
    );
  }

  DotsDecorator getDotDecoration() => DotsDecorator(
      color: Colors.grey,
      size: const Size(10, 10),
      activeColor: ThemeDataProvider.mainAppColor,
      activeSize: const Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ));

  void goToHome(BuildContext context) => Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LandingScreen()));

  Widget buildImage(String path) => Center(child: Image.asset(path));

  PageDecoration buildDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 26,
            fontFamily: "cairo",
            color: ThemeDataProvider.mainAppColor),
        bodyTextStyle: TextStyle(
          fontSize: 20,
          fontFamily: "cairo",
        ),
        bodyAlignment: Alignment.bottomCenter,
        imageAlignment: Alignment.bottomCenter,
        pageColor: Colors.white,
        imagePadding: EdgeInsets.only(
          top: 50,
          left: 10,
          right: 10,
        ),
      );
}
