import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:league_dashboard/core/error/failures.dart';
import 'package:league_dashboard/core/usecases/fetch_token.dart';
import 'package:league_dashboard/core/utils/constants.dart';
import 'package:league_dashboard/screen/login/domain/entities/login.dart';
import 'package:league_dashboard/screen/login/domain/usecases/login_user.dart';

import 'bloc.dart';

class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  final LoginUser loginUser;
  final FetchToken fetchToken;

  UserLoginBloc({required this.loginUser, required this.fetchToken});

  @override
  UserLoginState get initialState => NotLoggedState();

  @override
  Stream<UserLoginState> mapEventToState(UserLoginEvent event) async* {
    if (event is CheckLoginStatusEvent) {
      yield LoadingState();
      final result = await fetchToken(TokenParams());
      yield* result.fold((failure) async* {
        yield NotLoggedState();
      }, (success) async* {
        yield LoggedState(login: Login(token: success.token));
      });
    } else if (event is LoginEvent) {
      yield LoadingState();
      final result = await loginUser(LoginParams(email: event.username, password: event.password));
      yield* result.fold((failure) async* {
        if (failure is NoConnectionFailure) {
          yield ErrorState(message: NO_CONNECTION_ERROR);
        } else {
          yield ErrorState(message: LOGGING_ERROR);
        }
      }, (success) async* {
        yield LoggedState(login: Login(token: success.token));
      });
    } else if (event is SkipLoginEvent) {
      yield LoggedState(login: Login(token: "111111111111111111111111"));
    }
  }
}
