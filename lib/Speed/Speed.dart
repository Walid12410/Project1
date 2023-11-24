import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Speed_constructor.dart';

class Speedpage extends StatefulWidget {
  const Speedpage({super.key});

  @override
  State<Speedpage> createState() => _SpeedpageState();
}

class _SpeedpageState extends State<Speedpage> {
  double  result=0;
  TextEditingController _value = TextEditingController();
  Speed speed =speeds.first;

  double MilesperHourtoKilometersperHour(double mph){
    return mph*1.60934;
  }
  double KilometersperHourtoMilesperHour(double kph){
    return kph *0.621371;
  }
  updatespeed(Speed speed){
    setState(() {
      this.speed = speed;
    });
  }

  void totalresult(){
    try{
      setState(() {
        double z = double.parse(_value.text);
        if(speed.Convert=='mph To kph'){
          result = MilesperHourtoKilometersperHour(z);
        }else if(speed.Convert=='kph To mph'){
          result = KilometersperHourtoMilesperHour(z);
        }
      });
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid number'),
        duration: Duration(seconds: 3),),
      );
    }
  }

  void clearfield(){
    setState(() {
      result=0;
      _value.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Speed Convert'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        actions: [
          Tooltip(
            message: 'reset',
            child: IconButton(
              onPressed: (){clearfield();},
              icon: const Icon(
                Icons.restart_alt,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height:15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.8,
                  height:50,
                  child: TextField(
                    controller: _value,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d{0,9}\.?\d{0,4}')),],
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),style: TextStyle(fontSize: 10),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Only Number is allowed'
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width:36),
                  DropdownMenu(
                      width: MediaQuery.of(context).size.width*0.51,
                      initialSelection: speeds[0],
                      onSelected: (speed){
                        setState(() {
                          updatespeed(speed as Speed);
                        });
                      },
                      dropdownMenuEntries: speeds.map<DropdownMenuEntry<Speed>>((Speed speed) {
                        return DropdownMenuEntry(value: speed, label: speed.toString());
                      }).toList()),
                  const SizedBox(width: 15),
                  ElevatedButton(onPressed:(){
                    totalresult();
                  },
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(
                          MediaQuery.of(context).size.width*0.25,
                          50.0,
                        ))
                      ),
                      child:
                      const Text('Convert',style: TextStyle(fontSize: 12,color: Colors.black))
                  ),
                ],
              ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Result',style: TextStyle(fontSize: 25),),
                const SizedBox(width: 15),
                Expanded(
                  child:
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height:50,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child:Center(
                      child: Text(
                        '$result',
                        style:const TextStyle(fontSize: 20.0),
                      ),
                    ) ,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Divider(
              color: Colors.greenAccent,
              thickness: 5,
            ),
            Expanded(
              child: Image.network('https://images.unsplash.com/flagged/photo-1556370079-6a95afb55a6e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                width: MediaQuery.of(context).size.width*1 ,
                height:MediaQuery.of(context).size.height*0.4,
                fit: BoxFit.cover,
              ),
            ),
            const Divider(
              color: Colors.greenAccent,
              thickness: 5,
            ),
          ],
        ),
      ),
    );
  }
}
