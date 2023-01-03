import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seraty/utilites/themedata.dart';
import 'package:seraty/views/athkar/athkar_item.dart';
import '../../controllers/app_controller.dart';
import '../../utilites/file_operation.dart';

class AthkarScreen extends StatefulWidget {
  const AthkarScreen({Key? key}) : super(key: key);

  @override
  State<AthkarScreen> createState() => _AthkarScreenState();
}

class _AthkarScreenState extends State<AthkarScreen> {
  late AppController provider = Provider.of<AppController>(context);

  var azkarName = [];

  // ignore: prefer_typing_uninitialized_variables
  @override
  void initState() {
    getAzkarContent();
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
                    AthkarItem(azkarName.elementAt(index), index + 1),
                itemCount: azkarName.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  getAzkarContent() async {
    FileOperations fileOperations = FileOperations();
    String data =
        await fileOperations.getDataFromFile('assets/content/azkar_names.txt');
    azkarName = data.split("\n");
    setState(() {});
  }
}
