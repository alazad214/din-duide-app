const String baseUrl = "https://mehdi.softvencefsd.xyz/api/";

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
