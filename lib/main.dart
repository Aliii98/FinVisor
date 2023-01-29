
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/info.dart';
import 'pages/loading.dart';

void main () => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const Loading(),
    '/info': (context) => const Info(),
    '/home': (context) => Home()
  },
));


