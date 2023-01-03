import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seraty/controllers/app_controller.dart';
import 'package:seraty/utilites/themedata.dart';
import 'package:seraty/views/hadeth/hadeth_item.dart';
import '../../utilites/file_operation.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({Key? key}) : super(key: key);

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  late AppController provider = Provider.of<AppController>(context);
  var hadethName = [];

  // ignore: prefer_typing_uninitialized_variables
  late var borderColor;
  @override
  void initState() {
    getHadethContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10.0),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    HadethItem(hadethName.elementAt(index), index + 1),
                itemCount: hadethName.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  getHadethContent() async {
    FileOperations fileOperations = FileOperations();
    String data =
        await fileOperations.getDataFromFile('assets/content/hades_names.txt');
    hadethName = data.split("\n");
    setState(() {});
  }
}
