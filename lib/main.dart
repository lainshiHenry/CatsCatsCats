import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:cats_cats_cats/view/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import 'model/provider/theme_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  final TrackingStatus status =
      await AppTrackingTransparency.requestTrackingAuthorization();

  if (status == TrackingStatus.authorized) {
    MobileAds.instance.initialize();
  }

  runApp(
    MultiProvider(
      child: const MyApp(),
      providers: [],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeModel _themeModel = Provider.of<ThemeModel>(context);
    return MaterialApp(
      theme: _themeModel.getCurrentThemeData,
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
