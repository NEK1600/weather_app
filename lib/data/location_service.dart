import 'package:geolocator/geolocator.dart';

abstract interface class LocationService {
  Future<Position> getLocation();
}

class LocationServiceBase implements LocationService {
  @override
  Future<Position> getLocation() async {
    await Geolocator.checkPermission();
    final local = await Geolocator.getCurrentPosition();
    return local;
  }
}

class LocationServiceMock implements LocationService {
  @override
  Future<Position> getLocation() async {
    return Position(
        longitude: 5345,
        latitude: 3453,
        timestamp: DateTime(2),
        accuracy: 543,
        altitude: 543,
        altitudeAccuracy: 543,
        heading: 543,
        headingAccuracy: 543,
        speed: 543,
        speedAccuracy: 543
    );
  }
}
