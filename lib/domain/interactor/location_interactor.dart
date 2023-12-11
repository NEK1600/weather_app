import 'package:weather_app/core/exception_handle.dart';
import 'package:weather_app/core/exception_throw.dart';
import 'package:weather_app/domain/location.dart';
import 'package:weather_app/domain/repositories/location_repository.dart';

abstract interface class LocationInteractor {
  Future<Result<LocationBase, CustomFailure>> location();
}

class LocationInteractorBase implements LocationInteractor {
  final LocationRepository locationRepository;
  LocationInteractorBase({required this.locationRepository});

  @override
  Future<Result<LocationBase, CustomFailure>> location() async {
    try {
      final locationData = await locationRepository.location();
      return Success(locationData);
    } on LocationError {
      return Failure(LocationFailure(message: "включите геолокацию"));
    }
  }

}