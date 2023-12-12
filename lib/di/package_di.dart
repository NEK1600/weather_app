import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/presentation/navigation/router_configuration.dart';

class PackageDi {
  late SharedPreferences sharedPreferences;
  late GoRouter router;
  late FirebaseAuth firebaseAuth;
  late Geolocator location;
  Future init() async {
    sharedPreferences =  await SharedPreferences.getInstance();
    router = RouterConfiguration().getRouter();
    firebaseAuth = await FirebaseAuth.instance;
    location = Geolocator();
  }
}