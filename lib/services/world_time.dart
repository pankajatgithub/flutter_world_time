
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


 class WorldTime{

    String location;//location name foe the Ui
    String time;//ime in that location
    String flag;//url to an asset flag icon
    String url;//location url for the api endpoints

     WorldTime({this.location,this.flag,this.url});

    Future<void> getTime() async{
      try{
        Response response=await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
        print(response.body);
        //import dart:convert to use jsondecode method
        // here we will need to add datetime with offset to get actual local time
        Map data=jsonDecode(response.body);
        String dateTime=data['datetime'];
        //ERROR:flutter/lib/ui/ui_dart_state.cc(199)] Unhandled Exception: FormatException: Invalid radix-10 number (at character 2)
        // E/flutter ( 5677): +01:00 ,if we add directly to datetime without substring
        String offset=data['utc_offset'].substring(1,3);

        print(dateTime);
        print(offset);
        //   create dateTime Object
        DateTime now=DateTime.parse(dateTime);
        now=now.add(Duration(hours:int.parse(offset)));
        time=DateFormat.jm().format(now);
        print(time);

      }catch(e){
        print(e);
        time="could not get time variable";

      }

    }

    }