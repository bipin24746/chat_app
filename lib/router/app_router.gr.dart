// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:chat_app/features/auth_screen/presentation/login_screen/login_screen.dart'
    as _i2;
import 'package:chat_app/features/auth_screen/presentation/signup_screen/signup_screen.dart'
    as _i3;
import 'package:chat_app/features/home_screen/home_screen.dart' as _i1;
import 'package:chat_app/features/splash_screen/splash_screen.dart' as _i4;

/// generated route for
/// [_i1.HomeScreen]
class HomeScreenRoute extends _i5.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeScreenRoute.name, initialChildren: children);

  static const String name = 'HomeScreenRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreenRoute extends _i5.PageRouteInfo<void> {
  const LoginScreenRoute({List<_i5.PageRouteInfo>? children})
    : super(LoginScreenRoute.name, initialChildren: children);

  static const String name = 'LoginScreenRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginScreen();
    },
  );
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterScreenRoute extends _i5.PageRouteInfo<void> {
  const RegisterScreenRoute({List<_i5.PageRouteInfo>? children})
    : super(RegisterScreenRoute.name, initialChildren: children);

  static const String name = 'RegisterScreenRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i4.SplashScreen]
class SplashScreenRoute extends _i5.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i5.PageRouteInfo>? children})
    : super(SplashScreenRoute.name, initialChildren: children);

  static const String name = 'SplashScreenRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashScreen();
    },
  );
}
