import 'package:http/http.dart';
import 'Dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;
  String time='';
  String flag;
  String url;
  late bool isDayTime = false;

  WorldTime({required this.location, required this.flag , required this.url});

  Future<void> getTime() async{

      try {
        //get data
        Response responce = await get(
            Uri.parse('http://worldtimeapi.org/api/$url'));
        Map data = jsonDecode(responce.body);
        //print(data);

        //get properties
        String datatime = data['utc_datetime'];
        String offset = data['utc_offset'].substring(1, 3);

        //convert to DateTime and add the offset to the datatime
        DateTime now = DateTime.parse(datatime);
        now = now.add(Duration(hours: int.parse(offset)));

        isDayTime = now.hour > 5 && now.hour < 19;
        time = DateFormat.jm().format(now);
      }
      catch(e){
        print('caught error $e');
        time='could not find data';
      }
  }



}
