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
    data=data.isNotEmpty? data : ModalRoute.of(context).settings.arguments;
    print("received data id :$data");

    String bgImage=data['isDaytime']?'day.png':'night.png';
    Color bgColor=data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover
          )
        ),
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
              child: Column(
                children: [
                  FlatButton.icon(
                      onPressed: () async{
                        dynamic result=await Navigator.pushNamed(context, "/location");
                       setState(() {
                         data={
                           'time':result['time'],
                          'location':result['location'],
                          'isDaytime':result['isDaytime'],
                          'flag':result['flag']
                         };
                        });


                      },
                      icon: Icon(
                          Icons.edit_location,
                        color: Colors.grey[300],
                      ),
                      label: Text(
                          "Edit Location",
                        style: TextStyle(
                            color:Colors.grey[300]
                        ),

                      ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                            color:Colors.white
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                        color:Colors.white
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
