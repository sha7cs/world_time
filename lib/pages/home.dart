import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {

    data= data.isEmpty? ModalRoute.of(context)!.settings.arguments as Map: data;
    print(data);

    String DNimage= data['isDayTime']? 'day.png': 'night.png';
    Color DNcolor= data['isDayTime']? Colors.lightBlue[200]! : Colors.blue[900]!;

    return Scaffold(
      backgroundColor: DNcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$DNimage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0,200,0,0),
              child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    TextButton.icon(
                        onPressed: () async{
                          dynamic result = await Navigator.pushNamed(context, '/location');
                          setState(() {
                            data={
                              'location':result['location'],
                              'flag':result['flag'],
                              'time': result['time'],
                              'url':result['url'],
                              'isDayTime':result['isDayTime'],
                            };
                          });
                        },

                        icon: Icon(
                          Icons.location_on_outlined,
                          color: Colors.lightBlue[800],
                        ),
                        label: Text(
                            'Edit Location',
                          style: TextStyle(
                            color: Colors.lightBlue[800]
                          ),
                        )),
                    //SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(
                            data['location'],
                            style: TextStyle(
                              fontSize: 33,
                              letterSpacing: 2,
                              color: Colors.lightBlue[800],

                            )),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        data['time'],
                        style: TextStyle(
                          fontSize: 50,
                          letterSpacing: 2,
                          color: Colors.blue[900],
                        ),
                      ),
                    )
                  ]),
          ),
        ),

      ),

    );
  }
}
