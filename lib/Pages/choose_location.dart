import 'package:flutter/material.dart';
import 'package:World_Time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
   List<worldTime> locations = [
    worldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    worldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    worldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    worldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    worldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    worldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    worldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    worldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index)async
  {
   worldTime instance = locations[index];
   await instance.getTime();
   Navigator.pop(context , {
      'location': instance.location ,
      'flag' : instance.flag ,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime,
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.grey[200],
     appBar: AppBar(
     backgroundColor: Colors.blue[900],
     title: Text('Choose Loccation'),
     centerTitle: true,
     elevation: 0,
     ),
     body: ListView.builder(
    itemCount: locations.length,
    itemBuilder: (context , index)
    {
     return 
     Padding(
       padding: const EdgeInsets.symmetric(vertical: 1 , horizontal: 4),
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
    },
     ),
    );
  }
}
