import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/core/exception_handle.dart';

import '../../test_exception.dart';
import '../fake/fake_person_cache_repository.dart';

void main() {
  group('call fun', () {
    late PersonCacheInteractorBase personCacheInteractor;
    late FakePersonCacheRepository personCacheRepository;
    setUp(() {
      personCacheRepository = FakePersonCacheRepository();
      personCacheInteractor = PersonCacheInteractor(
        personCacheRepository: personCacheRepository,
      );
    });

    test('found', () async {
      var request = await personCacheInteractor.found();
      final result = switch (request) {
        Success(value:  final r) => expect(r, isA<AuthPerson>()),
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
