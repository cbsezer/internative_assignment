class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    _instance ??= ImageConstants._init();

    return _instance!;
  }

  ImageConstants._init();

  final String splashGif = 'assets/lottie/splash.json';
  final String loginAsset = 'assets/images/loginAsset.png';
  final String defaultUser = 'assets/images/defaultUser.png';
}
