import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  //as we are hitting api,we can't get data immediately,so we will use await to get result after api hit.await can be called inside
  //async function only.to await result result from parent class api hut,parent class must have 'Future' return type
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    // Navigator.pushNamed will do same but stack will contain loading page in that case
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime

    });

  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blue[900],
      body: Center(

        child:SpinKitFadingCube( //ex.SpinKitRotatingCircle
          color: Colors.white,
          size: 50.0,
        )

      )
    );
  }


}