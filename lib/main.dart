
import 'package:flutter/material.dart';
import 'package:world_time/Pages/choose_location.dart';
import 'package:world_time/Pages/loading.dart';
import 'package:world_time/Pages/home.dart';

void main() {
  runApp(MaterialApp(
    // home:Home(),  it will give error as default route is defined as loading page i.e. "/"
  initialRoute: "/home",//not necessary,we can set initial route if we want default page
                       // other than default route

    routes: {
      "/":(context)=>Loading(),
      "/home":(context)=>Home(),
      "/location":(context)=>ChooseLocation()
    },
  ));
}

