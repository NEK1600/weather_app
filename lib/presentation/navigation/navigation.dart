import 'package:go_router/go_router.dart';

abstract interface class Navigation {
  navigate(String page);
  showProgressDialog();
  showBaseDialog(String message);
  pop();
}

class NavigationBase implements Navigation {
  final GoRouter router;
  NavigationBase({required this.router});

  @override
  navigate(String page) {
    router.goNamed(page);
  }

  @override
  showBaseDialog(String message) {
    Map<String, String> pathParameters = {
      'message': message
    };
    router.pushNamed("dialog", extra:pathParameters);
  }

  @override
  showProgressDialog() {
    router.pushNamed("progressDialog");
  }

  @override
  pop() {
    router.pop();
  }
}
