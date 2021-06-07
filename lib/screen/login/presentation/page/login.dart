import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:league_dashboard/core/utils/constants.dart';
import 'package:league_dashboard/core/utils/theme.dart';
import 'package:league_dashboard/core/widget/custom_snak_bar.dart';
import 'package:league_dashboard/screen/login/presentation/blocs/user_login/user_login_bloc.dart';
import 'package:league_dashboard/screen/login/presentation/blocs/user_login/user_login_event.dart';
import 'package:league_dashboard/screen/login/presentation/blocs/user_login/user_login_state.dart';

import '../../../../injection_container.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailEditingController = TextEditingController(text: 'tishreen@cap10');
  final TextEditingController _passwordEditingController = TextEditingController(text: '12345678');

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _viewNode = FocusNode();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late CustomSnackBar _snackBar;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = true;
  }

  @override
  void dispose() {
    _emailNode.dispose();
    _passwordNode.dispose();
    _viewNode.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _snackBar = CustomSnackBar(key: Key("snackbar"), scaffoldKey: _scaffoldKey);
    return GestureDetector(
      // onTap: () => FocusScope.of(context).requestFocus(_viewNode),
      child: Scaffold(
        key: _scaffoldKey,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: CustomColor.statusBarColor,
          ),
          child: _buildBody(context),
        ),
      ),
    );
  }

  BlocProvider<UserLoginBloc> _buildBody(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isKeyboardOpen = (MediaQuery.of(context).viewInsets.bottom > 0);
    return BlocProvider<UserLoginBloc>(
      create: (_) => sl<UserLoginBloc>(),
      child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/login.png"),
              fit: BoxFit.fill,
            ),
          ),
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildHeader(isKeyboardOpen),
                // _buildHeader(isKeyboardOpen),
                Padding(
                  padding: EdgeInsets.only(right: 16, left: 16, top: 16),
                  child: Column(
                    children: [
                      _buildUsernameField(context),
                      SizedBox(height: 10),
                      _buildPasswordField(context),
                      SizedBox(height: 10),
                      _buildLoginButton(),
                    ],
                  ),
                ),

                // Padding(
                //   padding: EdgeInsets.only(top: 14),
                // ),
                // Container(
                //   width: double.infinity,
                //   height: 36,
                //   child: _buildSkipLoginButton(),
                // ),
              ],
            ),
          )),
    );
  }

  Widget _buildHeader(bool isKeyboardOpen) {
    if (!isKeyboardOpen) {
      return SizedBox(
        child: Image(
          image: AssetImage("images/logo_white.png"),
          fit: BoxFit.cover,
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.only(top: 74),
    );
  }

  BlocBuilder _buildLoginButton() {
    return BlocBuilder<UserLoginBloc, UserLoginState>(
      condition: (prevState, currState) {
        print("BlocBuilder state: " + currState.toString());
        if (currState is LoggedState) {
          _snackBar.hideAll();
          Navigator.pushNamedAndRemoveUntil(context, HOME_ROUTE, (r) => false);
        }
        return !(currState is LoggedState);
      },
      builder: (context, state) {
        print("builder state: " + state.toString());
        if (state is NotLoggedState || state is ErrorState) {
          if (state is ErrorState) {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              _snackBar.hideAll();
              _snackBar.showErrorSnackBar(state.message);
            });
          }
          return Container(
            width: 200,
            height: 40,
            child: ElevatedButton(
              key: Key("login"),
              style: ElevatedButton.styleFrom(
                primary: CustomColor.green,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () {
                if (_emailEditingController.text.isEmpty || _passwordEditingController.text.isEmpty) {
                  print('validation for empty');
                  Fluttertoast.showToast(
                      msg: "please type username and password",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      fontSize: 14.0);
                } else
                  BlocProvider.of<UserLoginBloc>(context).add(
                    LoginEvent(
                      _emailEditingController.text,
                      _passwordEditingController.text,
                    ),
                  );
              },
              child: Text(
                "LOGIN",
                style: CustomTheme.mainTheme.textTheme.button,
              ),
            ),
          );
        } else if (state is LoadingState) {

          WidgetsBinding.instance!.addPostFrameCallback((_) {
            // _snackBar.hideAll();
            // _snackBar.showLoadingSnackBar();
          });
          return Container(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            )
          );
        }
        return Container();
      },
    );
  }

  BlocBuilder _buildSkipLoginButton() {
    return BlocBuilder<UserLoginBloc, UserLoginState>(
      condition: (prevState, currState) {
        if (currState is LoggedState) {
          // _snackBar.hideAll();
          Navigator.pushNamedAndRemoveUntil(context, HOME_ROUTE, (r) => false);
        }
        return !(currState is LoggedState);
      },
      builder: (context, state) {
        if (state is NotLoggedState || state is ErrorState) {
          if (state is ErrorState) {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              _snackBar.hideAll();
              _snackBar.showErrorSnackBar(state.message);
            });
          }
          return RaisedButton(
            key: Key("skipLogin"),
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(4.0),
            ),
            color: CustomColor.logoBlue,
            onPressed: () {
              BlocProvider.of<UserLoginBloc>(context).add(
                SkipLoginEvent(),
              );
            },
            child: Text(
              "SKIP LOGIN",
              style: CustomTheme.mainTheme.textTheme.button,
            ),
          );
        } else if (state is LoadingState) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            _snackBar.hideAll();
            _snackBar.showLoadingSnackBar();
          });
          return Container();
        }
        return Container();
      },
    );
  }

  TextFormField _buildUsernameField(BuildContext context) {
    return TextFormField(
      focusNode: _emailNode,
      controller: _emailEditingController,
      keyboardType: TextInputType.name,
      style: TextStyle(color: Colors.white, fontSize: 16),
      decoration: InputDecoration(
        focusedBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(32.0),
          borderSide: new BorderSide(
            color: CustomColor.green,
          ),
        ),
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(32.0),
          borderSide: new BorderSide(
            color: CustomColor.textFieldBackground,
          ),
        ),
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(32.0),
          borderSide: new BorderSide(
            color: CustomColor.textFieldBackground,
          ),
        ),
        contentPadding: EdgeInsets.all(10),

        focusColor: CustomColor.hintColor,
        hoverColor: CustomColor.hintColor,
        fillColor: CustomColor.textFieldBackground,
        filled: true,
        labelText: "Username*",

        labelStyle: CustomTheme.mainTheme.textTheme.headline3,
      ),

      cursorColor: CustomColor.green,
      cursorHeight: 25,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _emailNode, _passwordNode);
      },
    );
  }

  TextFormField _buildPasswordField(BuildContext context) {
    return TextFormField(
      focusNode: _passwordNode,
      controller: _passwordEditingController,
      obscureText: _obscureText,
      style: TextStyle(color: Colors.white, fontSize: 16),
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        focusedBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(32.0),
          borderSide: new BorderSide(
            color: CustomColor.green,
          ),
        ),
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(32.0),
          borderSide: new BorderSide(
            color: CustomColor.green,
          ),
        ),
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(32.0),
          borderSide: new BorderSide(
            color: CustomColor.textFieldBackground,
          ),
        ),
        focusColor: CustomColor.hintColor,
        hoverColor: CustomColor.hintColor,
        fillColor: CustomColor.textFieldBackground,
        filled: true,
        contentPadding: EdgeInsets.all(10),
        labelText: "Password*",
        labelStyle: CustomTheme.mainTheme.textTheme.headline3,
        suffixIcon: IconButton(
          icon: Icon(Icons.remove_red_eye),
          color: CustomColor.white,
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      cursorColor: CustomColor.green,
      cursorHeight: 25,
    );
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
