import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:din_guide_app/core/helpers/network_checker/internet_screen.dart';
import 'package:get/get.dart';

class InternetController extends GetxController {
  final Connectivity connectivity = Connectivity();
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();

    checkInternetLoop();

    connectivity.onConnectivityChanged.listen((_) {
      checkInternet();
    });
  }

  Future<bool> isInternetAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } on SocketException {
      return false;
    }
  }

  Future<void> checkInternet() async {
    final hasInternet = await isInternetAvailable();

    if (!hasInternet && Get.currentRoute != '/no-internet') {
      Get.to(
        () => NoInternetScreen(onRetry: retryConnection),
        routeName: '/no-internet',
        fullscreenDialog: true,
        transition: Transition.fadeIn,
      );
    } else if (hasInternet && Get.currentRoute == '/no-internet') {
      Get.back();
    }
  }

  void retryConnection() {
    checkInternet();
  }

  void checkInternetLoop() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      checkInternet();
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
