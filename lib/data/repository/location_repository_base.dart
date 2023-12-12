import 'package:weather_app/data/location_service.dart';
import 'package:weather_app/domain/location.dart';
import 'package:weather_app/domain/repositories/location_repository.dart';

class LocationRepositoryBase implements LocationRepository {
  final LocationService locationService;
  LocationRepositoryBase({required this.locationService});
  @override
  Future<LocationBase> location() async {
    final local = await locationService.getLocation();
    final LocationBase location = LocationBase(
        lat: local.latitude,
        long: local.longitude
    );
    return location;
  }
}
