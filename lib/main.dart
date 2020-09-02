import 'package:flutter/material.dart';
import 'Pages/home.dart';
import 'Pages/choose_location.dart';
import 'Pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
    '/':(context)=>Loading(),
    '/home':(context)=>Home(),
    '/location':(context)=>ChooseLocation(),
    },
  ));
}

