import 'package:flutter/material.dart';
import 'package:login_cirrusci/src/blocs/login/login_bloc.dart';

class LoginProvider extends InheritedWidget {
  final bloc =LoginBloc();

  LoginProvider({Key key, Widget child}): super(key:key, child:child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
  
  static LoginBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(LoginProvider) as LoginProvider).bloc;
  }
}