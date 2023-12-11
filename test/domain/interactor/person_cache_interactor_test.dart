import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/core/exception_handle.dart';
import 'package:weather_app/domain/interactor/person_cache_interactor.dart';
import 'package:weather_app/domain/person_auth.dart';

import '../../test_exception.dart';
import '../fake/fake_person_cache_repository.dart';

void main() {
  group('call fun', () {
    late PersonCacheInteractorBase personCacheInteractor;
    late FakePersonCacheRepository personCacheRepository;
    setUp(() {
      personCacheRepository = FakePersonCacheRepository();
      personCacheInteractor = PersonCacheInteractorBase(
        personCacheRepository: personCacheRepository,
      );
    });

    test('found', () async {
      var request = personCacheInteractor.found();
      final result = switch (request) {
        Success(value:  final r) => expect(r, isA<PersonAuth>()),
        Failure(value: final e) => throw TestException(message: "ожидалась ошибка"),
      };
    });

    test('not found', () async {
      personCacheRepository.throwCacheError = true;
      var request = await personCacheInteractor.found();
      final result = switch (request) {
        Success(value:  final r) => throw TestException(message: "ожидалась ошибка"),
        Failure(value: final e) => expect(e, isA<CachePersonFailure>()),
      };
    });
  });
}
