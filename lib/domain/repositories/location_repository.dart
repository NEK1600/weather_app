import 'package:weather_app/domain/location.dart';

abstract interface class LocationRepository {
  Future<LocationBase> location();
}