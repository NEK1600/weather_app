import 'package:flutter_test/flutter_test.dart';

import '../fake/fake_auth_person_interactor.dart';
import '../fake/fake_navigation.dart';
import '../fake/fake_person_cache_interactor.dart';

void main() {
  group("call necessary fun", () {
    late LoginPageCubit loginCubit;
    late FakeNavigation navigate;
    late FakeAuthPersonInteractor authPersonInteractor;
    late FakePersonCacheInteractor personCacheInteractor;
    setUp(() {
      authPersonInteractor = FakeAuthPersonInteractor();
      navigate = FakeNavigation();
      personCacheInteractor = FakePersonCacheInteractor();
      loginCubit = LoginPageCubit(
        navigate: navigate,
        authPersonInteractor: authPersonInteractor,
        personCacheInteractor: personCacheInteractor,
      );
    });
    test("error validate", () async {
      authPersonInteractor.errorValidate = true;
      await loginCubit.login("", "");
      expect(navigate.callShowProgressDialog, 0);
      expect(navigate.callShowBaseDialog, 1);
      expect(authPersonInteractor.callResponse, 0);
    });

    test("error server", () async {
      authPersonInteractor.serverError = true;
      await loginCubit.login("", "");
      expect(navigate.callShowProgressDialog, 1);
      expect(authPersonInteractor.callResponse, 1);
      expect(navigate.callShowBaseDialog, 1);
      expect(personCacheInteractor.callSaveCache, 0);
    });

    test("success", () async {
      await loginCubit.login("", "");
      expect(navigate.callShowProgressDialog, 1);
      expect(authPersonInteractor.callResponse, 1);
      expect(navigate, "weatherPage");
      expect(personCacheInteractor.callSaveCache, 1);
    });

  });
}