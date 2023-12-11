

import 'package:weather_app/domain/location.dart';
import 'package:weather_app/domain/repositories/location_repository.dart';

class FakeLocationRepository implements LocationRepository {
  int callLocation = 0;
  @override
  Future<LocationBase> location() async {
    callLocation++;
    return LocationBase(
      lat: 1,
      long: 1,
    );
  }
}
