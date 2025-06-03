import 'package:package_info_plus/package_info_plus.dart';

class AppVersionInfo {
  static final AppVersionInfo _instance = AppVersionInfo._internal();
  factory AppVersionInfo() => _instance;
  AppVersionInfo._internal();

  late String appName;
  late String packageName;
  late String version;
  late String buildNumber;

  bool _isLoaded = false;

  Future<void> load() async {
    if (_isLoaded) return;

    final info = await PackageInfo.fromPlatform();
    appName = info.appName;
    packageName = info.packageName;
    version = info.version;
    buildNumber = info.buildNumber;
    _isLoaded = true;
  }
}
