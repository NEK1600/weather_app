import 'package:weather_app/data/cache_service.dart';
import 'package:weather_app/data/firebase_service.dart';
import 'package:weather_app/data/location_service.dart';
import 'package:weather_app/data/repository/cache_person_base.dart';
import 'package:weather_app/data/repository/cache_weather_base.dart';
import 'package:weather_app/data/repository/location_repository_base.dart';
import 'package:weather_app/data/repository/person_auth_repository_base.dart';
import 'package:weather_app/data/repository/weather_repository_base.dart';
import 'package:weather_app/data/serialization.dart';
import 'package:weather_app/data/weather_service.dart';
import 'package:weather_app/di/navigation_di.dart';
import 'package:weather_app/di/package_di.dart';
import 'package:weather_app/domain/interactor/location_interactor.dart';
import 'package:weather_app/domain/interactor/person_auth_interactor.dart';
import 'package:weather_app/domain/interactor/person_cache_interactor.dart';
import 'package:weather_app/domain/interactor/weather_interactor.dart';
import 'package:weather_app/presentation/view_model/initial_cubit.dart';
import 'package:weather_app/presentation/view_model/login_page_cubit.dart';
import 'package:weather_app/presentation/view_model/state_page/state_mutable_base.dart';
import 'package:weather_app/presentation/view_model/state_page/weather_page_state.dart';
import 'package:weather_app/presentation/view_model/weather_page_cubit.dart';

class ViewModelDi {
  final NavigationDi navigationDi;
  final PackageDi packageDi;
  late InitialCubit initialCubit;
  late WeatherPageCubit weatherCubit;
  late LoginPageCubit loginCubit;
  ViewModelDi({required this.packageDi, required this.navigationDi});

  Future init() async {
    weatherCubit = WeatherPageCubit(
        pageState: WeatherPageStateBase(
          stateBase: StateMutableBase<DataStateBase>(),
          stateBottom: StateMutableBase<DataStateBottom>(),
          stateCity: StateMutableBase<DataStateCity>(),
          stateHour: StateMutableBase<DataStateHour>(),
        ),
        locationInteractor: LocationInteractorBase(
          locationRepository: LocationRepositoryBase(
              locationService: LocationServiceBase(location: packageDi.location)
          ),
        ),
        weatherInteractor: WeatherInteractorBase(
          cacheWeather: CacheWeatherBase(
            cacheService: CacheServiceBase(
              cacheController: packageDi.sharedPreferences
            )
          ),
          weatherRepository: WeatherRepositoryBase(
            serialization: SerializationWeather(encoding: EncodingBase()),
            weatherService: WeatherServiceMock()
          ),
        ),
        navigation: navigationDi.navigationBase()
    );
  }

  LoginPageCubit loginCubitBase() {
    return LoginPageCubit(
        personAuthInteractor: PersonAuthInteractorBase(
          personCacheRepository: CachePersonBase(
            cacheService: CacheServiceBase(cacheController: packageDi.sharedPreferences),
          ),
          authRepository: PersonAuthRepositoryBase(
              firebaseService: FirebaseServiceImpl(firebaseAuth: packageDi.firebaseAuth)
          ),
        ),
        navigation: navigationDi.navigationBase(),
    );
  }

  InitialCubit initialCubitBase () {
    return InitialCubit(
        personCache: PersonCacheInteractorBase(
          personCacheRepository: CachePersonBase(
            cacheService: CacheServiceBase(
              cacheController: packageDi.sharedPreferences
            )
          )
        ),
        navigation: navigationDi.navigationBase()
    );
  }

}