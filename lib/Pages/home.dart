import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}
//text is surround with safe area because in this screen we will not use appbar
class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data=ModalRoute.of(context).settings.arguments;
    print("received data id :$data");

    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              FlatButton.icon(
                  onPressed: (){
                    Navigator.pushNamed(context, "/location");
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text("Edit Location"),
              )
            ],
          )
      ),
    );
  }
}
