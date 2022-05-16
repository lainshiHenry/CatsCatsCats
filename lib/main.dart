import 'package:cats_cats_cats/view/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'model/provider/theme_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // print(Platform.version);
  // if (Platform.isIOS) {
  //   final TrackingStatus status =
  //       await AppTrackingTransparency.requestTrackingAuthorization();
  //
  //   if (status == TrackingStatus.authorized) {
  //     MobileAds.instance.initialize();
  //   }
  // }

  runApp(
    MultiProvider(
      child: const MyApp(),
      providers: [
        ChangeNotifierProvider<ThemeModel>(create: (context) => ThemeModel())
      ],
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
