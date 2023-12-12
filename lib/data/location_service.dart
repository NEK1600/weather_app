import 'package:location/location.dart';

abstract interface class LocationService {
  Future<LocationData> getLocation();
}

class LocationServiceBase implements LocationService {
  final Location location;
  LocationServiceBase({required this.location});
  @override
  Future<LocationData> getLocation() async {
    final local = await location.getLocation();
    return local;
  }
}
