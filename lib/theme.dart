import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.lightBlueAccent[50],
    textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
        ),
  );
}

ThemeData darkTheme(BuildContext context) {
  return ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.blueGrey[900],
    textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
        ),
  );
}
