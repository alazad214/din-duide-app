const String salatUrl = "https://muslimsalat.com";
const String privacyPolicy = "https://github.com/alazad214/privacy-policy-example/blob/main/din_guide_privacy_policy";
const String websiteLink = "https://alazad.netlify.app/#/minified:wB";
const String facebookLink = "https://www.facebook.com/azad214official";
const quranAPI = "https://api.alquran.cloud/v1/quran/quran-uthmani";
const quranDetials = "https://online-quran-api.p.rapidapi.com/surahs/";


final class NetworkConstants {
  NetworkConstants._();
  static const accept = "Accept";
  static const appKey = "App-Key";
  static const acceptLanguage = "Accept-Language";
  static const acceptLanguageValue = "pt";
  static const appKeyValue = String.fromEnvironment("APP_KEY_VALUE");
  static const acceptType = "application/json";
  static const authorization = "Authorization";
  static const contentType = "content-Type";
}

final class PaymentGateway {
  PaymentGateway._();
  static String gateway() => "/create-payment-intent";
}

class Endpoints {
  Endpoints._();

  static String register() => "userRegister";
  static String logIn() => "userLogin";
  static String logout() => "logout";
  static String forget() => "resetPasswordOtp";
  static String verifyOtp() => "verifyResetOtp";
  static String resetPassword() => "resetPassword";
  static String profileData() => "profile/show";
  static String updateProfile() => "update-profile";
}
