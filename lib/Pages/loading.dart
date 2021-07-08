import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async{
     Response response=await get(Uri.parse("https://jsonplaceholder.typicode.com/todos/1"));
     print(response.body);
     //import dart:convert to use jsondecode method
    Map data=jsonDecode(response.body);
    print(data);
     print(data['title']);


  }
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading Screen"),
    );
  }
}
