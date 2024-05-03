import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

List<WorldTime> locations =[
  WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
  WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
  WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
  WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
  WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_Korea.png'),
  WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indeonisea.png'),
  WorldTime(url: 'Asia/Riyadh', location: 'Riyadh', flag: 'ksa.png'),
  WorldTime(url: 'Africa/Khartoum', location: 'Khartoum', flag: 'sudan.png'),
  WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'uae.png'),
  WorldTime(url: 'Asia/Gaza', location: 'Gaza', flag: 'palastine.png'),
  ];


void updateTime(index) async{
  WorldTime instance = locations[index];
  await instance.getTime();
  Navigator.pop(context, {
    'location':instance.location,
    'flag':instance.flag,
    'time':instance.time,
    'url':instance.url,
    'isDayTime': instance.isDayTime,
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('choose location'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[100],
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder:(context,index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1,horizontal: 2),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
