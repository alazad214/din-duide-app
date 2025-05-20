import 'dart:ui';

class OrderStatusNo {
  static const String kPENDING = '0';
  static const String kACCEPTED = '10';
  static const String kFOODPROCESSING = '20';
  static const String kFOODREADY = '21';
  static const String kFOODPICKED = '30';
  static const String kFOODDELIVERED = '40';
  static const String kCANCELLED = '80';
  static const String kREJECTEDBYSHOP = '90';
  static const String kFAILED = '100';
  static const String kALL = 'all';
}

class DeliveryStatusNo {
  static const String kPENDIG = '0';
  static const String kDELIVERYMANCONFIRMED = '10';
  static const String kDELIVERYSTARTED = '11';
  static const String kARRIVEDATSHOP = '20';
  static const String kONTRANSIT = '30';
  static const String kDELIVERED = '40';
}

class OrderStatusColor {
  static const Color kPENDING = Color(0xFF6c757d);
  static const Color kACCEPTED = Color(0xFF0b79fa);
  static const Color kFOODPROCESSING = Color(0xFF31a2b8);
  static const Color kFOODREADY = Color(0xFFffc234);
  static const Color kFOODPICKED = Color(0xFF6658dd);
  static const Color kFOODDELIVERED = Color(0xFF4fa744);
  static const Color kCANCELLED = Color(0xFFdd4246);
  static const Color kREJECTEDBYSHOP = Color(0xFFdd4246);
  static const Color kFAILED = Color(0xFFdd4246);
}

class DeliveryStatusColor {
  static const Color kPENDING = Color(0xFF6c757d);
  static const Color kDELIVERYMANCONFIRMED = Color(0xFF0b79fa);
  static const Color kDELIVERYSTARTED = Color(0xFF6658dd);
  static const Color kARRIVEDATSHOP = Color(0xFFffc234);
  static const Color kONTRANSIT = Color(0xFFa5d23c);
  static const Color kDELIVERED = Color(0xFF4fa744);
}

class DefaultValue {
  static const bool kDefaultBoolean = false;
  static const int kDefaultInt = 0;
  static const double kDefaultDouble = 0.0;
  static const String kDefaultString = '';
}

const String kKeyStatus = 'status';
const String kEmail = 'email';
const String kUserEmail = 'userEmail';
const String kKeyIsLogin = 'is_login';
const String kKayAccessToken = 'accessToken';
const String userId = 'user_id';
const String forgetEmail = 'forget_Email';
const String forgetOtp = 'forget_otp';
