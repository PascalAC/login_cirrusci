import 'package:flutter/material.dart';
import 'package:login_cirrusci/src/blocs/login/login_bloc.dart';
import 'package:login_cirrusci/src/blocs/login/login_provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginBloc = LoginProvider.of(context);

    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(loginBloc),
          passwordField(loginBloc),
          Container(margin: const EdgeInsets.only(top: 20.0)),
          submitButton(loginBloc),
        ],
      ),
    );
  }

  Widget emailField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          key: Key('emailInput'),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email Address',
            hintText: 'you@example.com',
            errorText: snapshot.error,
          ),
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget passwordField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          key: Key('passwordInput'),
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your password',
            errorText: snapshot.error,
          ),
          obscureText: true,
          onChanged: bloc.changePassword,
        );
      },
    );
  }

  Widget submitButton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('LOGIN'),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: snapshot.hasData ? bloc.submit : null,
        );
      },
    );
  }
}