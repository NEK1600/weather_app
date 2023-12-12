import 'package:weather_app/di/package_di.dart';
import 'package:weather_app/presentation/navigation/navigation.dart';

class NavigationDi {
  final PackageDi packageDi;
  NavigationDi({
    required this.packageDi,
  });
  init() {}
  NavigationBase navigationBase() {
    return NavigationBase(router: packageDi.router);
  }
}