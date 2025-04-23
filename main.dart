import 'package:flutter/material.dart';
import 'package:mausam_app/Acitivity/location.dart';
import 'package:mausam_app/activity/home.dart';
import 'package:mausam_app/activity/loading.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => Home(),
        "/loading": (context) => Loading(),
      },
    ),
  );
}
