import 'package:dartz/dartz.dart';
import 'package:league_dashboard/core/error/failures.dart';
import 'package:league_dashboard/screen/login/domain/entities/login.dart';

abstract class LoginRepository {
  Future<Either<Failure, Login>> loginUser(String email, String password);
  Future<Either<Failure, Login>> fetchCachedToken();
}
