part of 'app_router.dart';


@AutoRouterConfig(replaceInRouteName: 'page')
class AppRouter extends RootStackRouter{
  RouteType get defualtRouterType => RouteType.adaptive();

  final List<AutoRoute> routes = [
    AutoRoute(page: SplashScreenRoute.page,path: '/'),
    AutoRoute(page: LoginScreenRoute.page),
    AutoRoute(page: RegisterScreenRoute.page),
    // AutoRoute(page: HomeScreenRoute.page),
    AutoRoute(page: LoginWithPhoneNumberRoute.page),
    AutoRoute(page: VerifyOtpScreenRoute.page),
    AutoRoute(page: SelectUserScreenRoute.page),
    AutoRoute(page: ChatScreenRoute.page)
  ];
}