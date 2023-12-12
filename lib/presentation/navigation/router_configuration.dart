
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/presentation/page/login_page.dart';
import 'package:weather_app/presentation/page/splash_page.dart';
import 'package:weather_app/presentation/page/weather_page.dart';
import 'package:weather_app/presentation/widget/base/dialog/custom_dialog.dart';
import 'package:weather_app/presentation/widget/base/dialog/dialog_base_widget.dart';
import 'package:weather_app/presentation/widget/base/dialog/progress_dialog_widget.dart';

class RouterConfiguration {
  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  GoRouter getRouter(){
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: "/splashScreen",
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: '/splashScreen',
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: '/loginPage',
          name: 'loginPage',
          builder: (context, state) => LoginPage(),
        ),

        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: '/weatherPage',
          name: 'weatherPage',
          builder: (context, state) {
            return const WeatherPage();
          },
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: '/dialog',
          name: 'dialog',
          pageBuilder: (BuildContext context, GoRouterState state) {
            Map<String, String> extra = state.extra as Map<String, String>;
            return CustomDialog(builder: (_) => DialogBasePage(
              message: extra["message"]!,
            ));
          },
        ),

        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: '/progressDialog',
          name: 'progressDialog',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomDialog(builder: (_) => const ProgressDialogWidget());
          },
        )
      ],
    );
  }
}
