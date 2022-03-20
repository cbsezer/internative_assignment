class TextConstants {
  static TextConstants? _instance;
  static TextConstants get instance {
    _instance ??= TextConstants._init();

    return _instance!;
  }

  TextConstants._init();

  final String loginPage = 'Login';
  final String signUpPage = 'Sign Up';
  final String homePage = 'Home';
  final String aricleDetailPage = 'Article Detail';
  final String favorites = 'My Favorites';
  final String profile = 'My Profile';

  final String select = 'Select';
  final String remove = 'Remove';
  final String selectPicture = 'Select a Picture';
  final String save = 'Save';
  final String logOut = 'Log Out';

  final String email = 'Email';
  final String password = 'Password';
  final String rePassword = 'Re-Password';
  final String register = 'Register';
  final String login = 'Login';
  final String loading = 'Loading';

  final String validateMailError = "Geçerli bir e-posta adresi giriniz.";
  final String validatePassword = "Geçerli bir şifre giriniz.";
  final String passwordAgainValidateError = 'Şifreler uyuşmuyor.';
}
