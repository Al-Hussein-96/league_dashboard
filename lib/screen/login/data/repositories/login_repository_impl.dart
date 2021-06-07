import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:league_dashboard/core/error/error.dart';
import 'package:league_dashboard/core/error/failures.dart';
import 'package:league_dashboard/core/network/network_info.dart';
import 'package:league_dashboard/screen/login/data/datasources/login_local_datasource.dart';
import 'package:league_dashboard/screen/login/data/datasources/login_remote_datasource.dart';
import 'package:league_dashboard/screen/login/domain/entities/login.dart';
import 'package:league_dashboard/screen/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final LoginLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl({required this.remoteDataSource, required this.localDataSource, required this.networkInfo});

  Future<Either<Failure, Login>> loginUser(String username, String password) async {
    print('login user: ' + username + " : " + password);
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.loginUser(username, password);
        print('remoteData: ' + remoteData.token);
        localDataSource.cacheToken(remoteData);
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure());
      } on DataException{
        print('DataException');
        return Left(DataFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Login>> fetchCachedToken() async {
    try {
      final localData = await localDataSource.getLastToken();
      return Right(localData);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
