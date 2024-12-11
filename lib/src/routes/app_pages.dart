import 'package:fitnest_app/src/routes/route.dart';
import 'package:get/get.dart';
import '../getx_binding/binding.dart';
import '../view/onboarding_pages/onboard.dart';
import '../view/onboarding_pages/onboard_page.dart';
import 'error_route.dart';

class AppPage {
  static final pages = [
    GetPage(
        name: MyAppRouts.splashPage,
        page: () => const OnBoardPage(),
        transition: Transition.fade,
        binding: BoardBinding()),
    GetPage(
        name: MyAppRouts.onboardPage,
        page: () => const OnboardViewPage(),
        transition: Transition.fade,
        binding: BoardBinding()),
    GetPage(
        name: MyAppRouts.errorPage,
        page: () => const ErrorPage(),
        transition: Transition.fade),
  ];
}
