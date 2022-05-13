import 'dart:io';

class AdHelper {
  //prod code
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'c';
    } else if (Platform.isIOS) {
      return 'c';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

// //test code
// static String get bannerAdUnitId {
//   if (Platform.isAndroid) {
//     return 'ca-app-pub-4130966393108621/7807989010';
//   } else if (Platform.isIOS) {
//     return 'ca-app-pub-3940256099942544/2934735716'; //ca-app-pub-3940256099942544/2934735716 test adUnitID IOS
//   } else {
//     throw UnsupportedError('Unsupported platform');
//   }
// }
}
