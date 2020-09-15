import 'package:flutter/material.dart';
import 'package:the_vault/routes.dart';


void main() {
  runApp(TheVault());
}

class TheVault extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Vault',
      theme: ThemeData.dark().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: routes,
    );
  }
}