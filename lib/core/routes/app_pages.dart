import 'package:din_guide_app/core/routes/app_routes.dart';
import 'package:din_guide_app/features/splash/welcome_screen.dart';
import 'package:din_guide_app/features/bottom_nav/presentation/navigation_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../features/assistant/presentation/ai_assistant_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.navigationScreen,
      page: () => const NavigationScreen(),
    ),
    GetPage(
      name: AppRoutes.assistantScreen,
      page: () => const AiAssistantScreen(),
    ),
    GetPage(name: AppRoutes.loadingScreen, page: () => const LoadingScreen()),
  ];
}
