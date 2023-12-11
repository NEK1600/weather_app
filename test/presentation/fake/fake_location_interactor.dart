
import 'package:weather_app/core/exception_handle.dart';
import 'package:weather_app/domain/interactor/location_interactor.dart';
import 'package:weather_app/domain/location.dart';

class FakeLocationInteractor implements LocationInteractor {
  int callLocation = 0;
  @override
  Future<Result<LocationBase, CustomFailure>> location() async {
    callLocation++;
    return Success(LocationBase(
      lat: 1,
      long: 1,
    ));
  }
}
