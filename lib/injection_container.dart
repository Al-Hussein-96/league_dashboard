import 'package:chopper/chopper.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:league_dashboard/screen/games/data/datasource/game_remote_datasource.dart';
import 'package:league_dashboard/screen/games/data/repositories/game_repository_impl.dart';
import 'package:league_dashboard/screen/games/domain/repositories/game_repository.dart';
import 'package:league_dashboard/screen/games/domain/usecases/get_games.dart';
import 'package:league_dashboard/screen/games/presentation/blocs/games/bloc.dart';
import 'package:league_dashboard/screen/login/data/datasources/login_local_datasource.dart';
import 'package:league_dashboard/screen/login/data/datasources/login_remote_datasource.dart';
import 'package:league_dashboard/screen/login/data/repositories/login_repository_impl.dart';
import 'package:league_dashboard/screen/login/domain/repositories/login_repository.dart';
import 'package:league_dashboard/screen/login/domain/usecases/login_user.dart';
import 'package:league_dashboard/screen/login/presentation/blocs/user_login/user_login_bloc.dart';
import 'package:league_dashboard/screen/login/presentation/blocs/user_login/user_login_event.dart';
import 'package:league_dashboard/screen/teams/data/datasource/team_remote_datasource.dart';
import 'package:league_dashboard/screen/teams/data/repositories/login_repository_impl.dart';
import 'package:league_dashboard/screen/teams/domain/repositories/team_repository.dart';
import 'package:league_dashboard/screen/teams/domain/usecases/get_teams.dart';
import 'package:league_dashboard/screen/teams/presentation/blocs/teams/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/network/rest_client_service.dart';
import 'core/usecases/fetch_token.dart';
import 'core/usecases/get_list_teams.dart';

final sl = GetIt.instance; //sl is referred to as Service Locator

//Dependency injection
Future<void> init() async {
  //Blocs
  sl.registerFactory(
    () => UserLoginBloc(
      loginUser: sl(),
      fetchToken: sl(),
    )..add(CheckLoginStatusEvent()),
  );
  sl.registerFactory(
        () => TeamsBloc(
      getTeams: sl(),
    )..add(TeamsLoadedEvent(4)),
  );
  sl.registerFactory(
        () => GamesBloc(
      getGames: sl(),
    )..add(GamesLoadedEvent(4)),
  );




  // sl.registerFactory(
  //   () => LogOutBloc(
  //     fetchToken: sl(),
  //     logoutUser: sl(),
  //   ),
  // );
  // sl.registerFactory(
  //   () => ChangePasswordBloc(
  //     changePassword: sl(),
  //   ),
  // );

  //Use cases
  sl.registerLazySingleton(() => LoginUser(repository: sl()));
  sl.registerLazySingleton(() => FetchToken(repository: sl()));
  sl.registerLazySingleton(() => GetListTeams(repository: sl()));
  sl.registerLazySingleton(() => GetTeams(repository: sl()));
  sl.registerLazySingleton(() => GetGames(repository: sl()));

  //Repositories
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      networkInfo: sl(),
      localDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<TeamRepository>(
        () => TeamRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<GameRepository>(
        () => GameRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );
  // sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
  //       networkInfo: sl(),
  //       localDataSource: sl(),
  //       remoteDataSource: sl(),
  //     ));
  // sl.registerLazySingleton<ChangePasswordRepository>(() => ChangePasswordRepositoryImpl(
  //   networkInfo: sl(),
  //   localDataSource: sl(),
  //   remoteDataSource: sl(),
  // ));


  //Data sources
  sl.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(
      restClientService: sl(),
    ),
  );
  sl.registerLazySingleton<LoginLocalDataSource>(
    () => LoginLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
  sl.registerLazySingleton<TeamRemoteDataSource>(
        () => TeamRemoteDataSourceImpl(
      restClientService: sl(),
    ),
  );
  sl.registerLazySingleton<GameRemoteDataSource>(
        () => GameRemoteDataSourceImpl(
      restClientService: sl(),
    ),
  );

  // sl.registerLazySingleton<HomeRemoteDataSource>(
  //   () => HomeRemoteDataSourceImpl(
  //     restClientService: sl(),
  //   ),
  // );
  // sl.registerLazySingleton<HomeLocalDataSource>(
  //   () => HomeLocalDataSourceImpl(
  //     sharedPreferences: sl(),
  //   ),
  // );
  // sl.registerLazySingleton<ChangePasswordRemoteDataSource>(
  //       () => ChangePasswordRemoteDataSourceImpl(
  //     restClientService: sl(),
  //   ),
  // );
  // sl.registerLazySingleton<ChangePasswordLocalDataSource>(
  //       () => ChangePasswordLocalDataSourceImpl(
  //     sharedPreferences: sl(),
  //   ),
  // );

  //Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(dataConnectionChecker: sl()),
  );

  //External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => DataConnectionChecker());
  final client = ChopperClient(interceptors: [
    CurlInterceptor(),
    HttpLoggingInterceptor(),
  ]);
  sl.registerLazySingleton(() => RestClientService.create(client));
}
