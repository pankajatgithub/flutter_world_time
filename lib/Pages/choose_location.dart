import 'package:flutter/material.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter=0;
  void getData() async{
    //simulate network request to get username
   await Future.delayed(Duration(seconds: 3),(){
      print("yoshi");
    });

    //simulate network request to get user bio
    await Future.delayed(Duration(seconds: 2),(){
      print("vegan,musician,blogger");
    });

    print("Statement");

  }
  @override
  void initState() {
    super.initState();
    getData();
    print("Init state function");
  }

  @override
  Widget build(BuildContext context) {
    print("Build state function");

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: RaisedButton(
        onPressed: (){
          setState(() {
            counter += 1;
          });
        },
        child: Text("counter value is $counter"),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    print("Dispose state function");

  }


}
