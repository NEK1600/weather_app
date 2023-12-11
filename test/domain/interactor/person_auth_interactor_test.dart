import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/core/exception_handle.dart';

import '../../test_exception.dart';
import '../fake/fake_person_auth_repository.dart';
import '../fake/fake_person_cache_repository.dart';

void main() {
  group("", () {
    late PersonAuthInteractorBase personAuthInteractor;
    late FakePersonAuthRepository personAuthRepository;
    late FakePersonCacheRepository personCacheRepository;
    setUp(() {
      personAuthRepository = FakePersonAuthRepository();
      personCacheRepository = FakePersonCacheRepository();
      personAuthInteractor = PersonAuthInteractorBase(
        personAuthRepository: personAuthRepository,
        personCacheRepository: personCacheRepository,
      );
    });

    test("validate", () {
      final String validate = personAuthInteractor.validate("", "");
      expect(validate, "failure");
      final String validateSuccess = personAuthInteractor.validate("a", "1");
      expect(validateSuccess, "success");
    });

    test("handle server error", () async {
      personAuthRepository.throwServerError = true;
      var handleException = await personAuthInteractor.response("", "");
      final result = switch (handleException) {
        Success(value:  final r) => throw TestException(message: "ожидалась ошибка"),
        Failure(value: final e) => expect(e, isA<ServerFailure>()),
      };
    });

    test("success save cache", () async {
      var request = await personAuthInteractor.response("", "");
      final result = switch (request) {
        Success(value:  final r) => expect(personCacheRepository.callSave, 1),
        Failure(value: final e) => throw TestException(message: "ожидался успех"),
      };
      expect(personAuthRepository.callResponse, 1);
    });
  });
}
