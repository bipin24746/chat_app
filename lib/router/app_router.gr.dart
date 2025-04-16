// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:chat_app/features/auth_screen/presentation/login_screen/login_screen.dart'
    as _i2;
import 'package:chat_app/features/auth_screen/presentation/login_with_phone_number/login_with_phone_number.dart'
    as _i3;
import 'package:chat_app/features/auth_screen/presentation/login_with_phone_number/verify_code.dart'
    as _i6;
import 'package:chat_app/features/auth_screen/presentation/signup_screen/signup_screen.dart'
    as _i4;
import 'package:chat_app/features/home_screen/home_screen.dart' as _i1;
import 'package:chat_app/features/splash_screen/splash_screen.dart' as _i5;
import 'package:flutter/material.dart' as _i8;

/// generated route for
/// [_i1.HomeScreen]
class HomeScreenRoute extends _i7.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i7.PageRouteInfo>? children})
    : super(HomeScreenRoute.name, initialChildren: children);

  static const String name = 'HomeScreenRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreenRoute extends _i7.PageRouteInfo<void> {
  const LoginScreenRoute({List<_i7.PageRouteInfo>? children})
    : super(LoginScreenRoute.name, initialChildren: children);

  static const String name = 'LoginScreenRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginScreen();
    },
  );
}

/// generated route for
/// [_i3.LoginWithPhoneNumber]
class LoginWithPhoneNumberRoute extends _i7.PageRouteInfo<void> {
  const LoginWithPhoneNumberRoute({List<_i7.PageRouteInfo>? children})
    : super(LoginWithPhoneNumberRoute.name, initialChildren: children);

  static const String name = 'LoginWithPhoneNumberRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginWithPhoneNumber();
    },
  );
}

/// generated route for
/// [_i4.RegisterScreen]
class RegisterScreenRoute extends _i7.PageRouteInfo<void> {
  const RegisterScreenRoute({List<_i7.PageRouteInfo>? children})
    : super(RegisterScreenRoute.name, initialChildren: children);

  static const String name = 'RegisterScreenRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i5.SplashScreen]
class SplashScreenRoute extends _i7.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i7.PageRouteInfo>? children})
    : super(SplashScreenRoute.name, initialChildren: children);

  static const String name = 'SplashScreenRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.SplashScreen();
    },
  );
}

/// generated route for
/// [_i6.VerifyOtpScreen]
class VerifyOtpScreenRoute extends _i7.PageRouteInfo<VerifyOtpScreenRouteArgs> {
  VerifyOtpScreenRoute({
    _i8.Key? key,
    required String verificationId,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         VerifyOtpScreenRoute.name,
         args: VerifyOtpScreenRouteArgs(
           key: key,
           verificationId: verificationId,
         ),
         initialChildren: children,
       );

  static const String name = 'VerifyOtpScreenRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerifyOtpScreenRouteArgs>();
      return _i6.VerifyOtpScreen(
        key: args.key,
        verificationId: args.verificationId,
      );
    },
  );
}

class VerifyOtpScreenRouteArgs {
  const VerifyOtpScreenRouteArgs({this.key, required this.verificationId});

  final _i8.Key? key;

  final String verificationId;

  @override
  String toString() {
    return 'VerifyOtpScreenRouteArgs{key: $key, verificationId: $verificationId}';
  }
}
