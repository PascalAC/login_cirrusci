import 'package:flutter/material.dart';
import 'package:login_cirrusci/src/blocs/login/login_provider.dart';
import 'package:login_cirrusci/src/screen/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginProvider(
      child: MaterialApp(
        title: 'Login',
        home: Scaffold(
          body: LoginScreen(),
          appBar: AppBar(
            title: Text('Login'),
          ),
        ),
      ),
    );
  }
}