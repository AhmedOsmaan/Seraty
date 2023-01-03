import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:seraty/controllers/app_controller.dart';
import 'package:seraty/utilites/themedata.dart';
import 'package:seraty/utilites/loading_indicator.dart';
import 'package:seraty/views/alqibla/error_location_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AlQiblahCompass extends StatefulWidget {
  const AlQiblahCompass({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AlQiblahCompassState createState() => _AlQiblahCompassState();
}

class _AlQiblahCompassState extends State<AlQiblahCompass> {
  // ignore: prefer_typing_uninitialized_variables
  var futureAlbum;
  @override
  void initState() {
    futureAlbum = Provider.of<AppController>(context, listen: false)
        .checkLocationStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
        stream: Provider.of<AppController>(context, listen: false).stream,
        builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          }
          if (snapshot.data!.enabled == true) {
            switch (snapshot.data!.status) {
              case LocationPermission.always:
              case LocationPermission.whileInUse:
                return QiblahCompassWidget();

              case LocationPermission.denied:
                return ErrorLocationWidget(
                  error: "Location service permission denied",
                  callback: futureAlbum,
                );
              case LocationPermission.deniedForever:
                return ErrorLocationWidget(
                  error: "Location service Denied Forever !",
                  callback: futureAlbum,
                );
              default:
                return Container();
            }
          } else {
            return ErrorLocationWidget(
              error: "Please enable Location service",
              callback: futureAlbum,
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    FlutterQiblah().dispose();
  }
}

class QiblahCompassWidget extends StatelessWidget {
  final _compassSvg = SvgPicture.asset(
    'assets/images/compass.svg',
    color: ThemeDataProvider.mainAppColor,
  );
  final _needleSvg = SvgPicture.asset(
    'assets/images/needle.svg',
    fit: BoxFit.contain,
    height: 300,
    alignment: Alignment.center,
  );

  QiblahCompassWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        }

        final qiblahDirection = snapshot.data!;

        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Transform.rotate(
              angle: (qiblahDirection.direction * (pi / 180) * -1),
              child: _compassSvg,
            ),
            Transform.rotate(
              angle: (qiblahDirection.qiblah * (pi / 180) * -1),
              alignment: Alignment.center,
              child: _needleSvg,
            ),
            Positioned(
              bottom: 8,
              child: Text("${qiblahDirection.offset.toStringAsFixed(3)}°"),
            )
          ],
        );
      },
    );
  }
}
