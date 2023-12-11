import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/domain/interactor/location_interactor.dart';

import '../fake/fake_location_repository.dart';

void main() {
  group('call fun', () {
    late LocationInteractorBase locationInteractor;
    late FakeLocationRepository locationRepository;
    setUp(() {
      locationRepository = FakeLocationRepository();
      locationInteractor = LocationInteractorBase(
        locationRepository: locationRepository,
      );
    });
    test('call fun', () async {
      await locationInteractor.location();
      expect(locationRepository.callLocation, 1);
    });
  });
}
