const String salatUrl = "https://muslimsalat.com";
const String privacyPolicy = "https://github.com/alazad214/privacy-policy-example/blob/main/din_guide_privacy_policy";
const String websiteLink = "https://alazad.netlify.app/#/minified:wB";
const String facebookLink = "https://www.facebook.com/azad214official";
final class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
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
