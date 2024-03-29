import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../app/sl.dart';
import '../home_layout/view/home_layout_view.dart';
import '../login_screen/view/login_view.dart';
import '../register_layout/view/register_layout_view.dart';
import '../selection_screen/view/selection_view.dart';
import '../splash_screen/view/splash_view.dart';
import 'strings_manager.dart';

class Routes {
  Routes._();

  static const String splashRoute = "/";
  static const String selectionRoute = "/selection";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String homeRoute = "/home";
}

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        initSignedUserUseCase();
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.selectionRoute:
        return MaterialPageRoute(builder: (_) => const SelectionScreen());
      case Routes.loginRoute:
        initLoginUseCase();
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.registerRoute:
        initRegisterUseCase();
        return MaterialPageRoute(builder: (_) => const RegisterLayoutScreen());
      case Routes.homeRoute:
        initAppStatusUseCase();
        initLogOutUseCase();
        return MaterialPageRoute(builder: (_) => const HomeLayout());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.noRouteFound.tr()),
        ),
        body: Center(child: Text(AppStrings.noRouteFound.tr())),
      ),
    );
  }
}
