import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:league_dashboard/core/error/failures.dart';
import 'package:league_dashboard/core/usecases/usecase.dart';
import 'package:league_dashboard/screen/login/domain/entities/login.dart';
import 'package:league_dashboard/screen/login/domain/repositories/login_repository.dart';

class FetchToken implements UseCase<Login, TokenParams> {
  final LoginRepository repository;

  FetchToken({required this.repository});

  @override
  Future<Either<Failure, Login>> call(TokenParams params) async {
    return await repository.fetchCachedToken();
  }
}

class TokenParams extends Equatable {}
