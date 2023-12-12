import 'package:weather_app/presentation/navigation/navigation.dart';

class FakeNavigation implements Navigation {
  String putNavigate = "";
  int callShowProgressDialog = 0;
  int callShowBaseDialog = 0;
  @override
  navigate(String page) {
    putNavigate = page;
  }

  @override
  showProgressDialog() {
    callShowProgressDialog++;
  }

  @override
  showBaseDialog(String message) {
    callShowBaseDialog++;
  }

  @override
  pop() {
    // TODO: implement pop
    throw UnimplementedError();
  }
}
