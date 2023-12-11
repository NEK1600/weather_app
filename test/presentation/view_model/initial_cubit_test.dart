import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/presentation/view_model/initial_cubit.dart';

import '../fake/fake_navigation.dart';
import '../fake/fake_person_cache_interactor.dart';

void main() {
  group("call necessary fun", () {
    late InitialCubit initialCubit;
    late FakePersonCacheInteractor personCache;
    late FakeNavigation navigation;
    setUp(() {
      personCache = FakePersonCacheInteractor();
      navigation = FakeNavigation();
      initialCubit = InitialCubit(
        personCache: personCache,
        navigation: navigation,
      );
    });

    test('initialApp()', () async {
      await initialCubit.initialApp();
      expect(personCache.callFound, 1);
      expect(navigation.putNavigate, "weatherPage");
    });

    test('initialApp(), person not found', () async {
      personCache.personFound = false;
      await initialCubit.initialApp();
      expect(personCache.callFound, 1);
      expect(navigation.putNavigate, "loginPage");
    });
  });
}
