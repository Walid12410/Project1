import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'power_constructor.dart';


class Powerpage extends StatefulWidget {
  const Powerpage({super.key});

  @override
  State<Powerpage> createState() => _PowerpageState();
}

class _PowerpageState extends State<Powerpage> {
double _result1 = 0;
double _result2 = 0;
double _result3 = 0;
double _result4 = 0;


final TextEditingController _wkcontroller = TextEditingController();
final TextEditingController _kwcontroller = TextEditingController();
final TextEditingController _whcontroller = TextEditingController();
final TextEditingController _hwcontroller = TextEditingController();


void WTK(){
  try{
    setState(() {
      double h = double.parse(_wkcontroller.text);
      Power power = Power();
      _result1 = power.WattToKiloWatt(h);
    });
  }catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter a valid number'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
void WTH(){
  try{
    setState(() {
      double h = double.parse(_whcontroller.text);
      Power power = Power();
      _result2 = power.WattToHorsepower(h);
    });
  }catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter a valid number'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
void KTW(){
  try{
    setState(() {
      double h = double.parse(_kwcontroller.text);
      Power power = Power();
      _result3 = power.KiloToWatt(h);
    });
  }catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter a valid number'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
void HTW(){
  try{
    setState(() {
      double h = double.parse(_hwcontroller.text);
      Power power = Power();
      _result4 = power.HorsepowerToWatt(h);
    });
  }catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter a valid number'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
void clearfields(){
  setState(() {
    _hwcontroller.clear();
    _kwcontroller.clear();
    _wkcontroller.clear();
    _whcontroller.clear();
    _result1=0;
    _result2=0;
    _result3=0;
    _result4=0;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('Power Convert'),
        titleTextStyle: const TextStyle(fontSize: 15),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [
          Tooltip(
            message: 'Reset',
            child: IconButton(
              onPressed: (){clearfields();},
              icon:const  Icon(
                Icons.restart_alt,
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child:Column(
            children: [
              const SizedBox(height: 10),
              const Text('Convert from Watt to Killo Watt',
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Mywidget(controller: _wkcontroller),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){WTK();},
                      child:const  Text('Convert',style: TextStyle(fontSize: 25,color: Colors.red),)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 33),
                  Text('Watt to killo ($_result1)'),
                ],
              ),
              const Divider(
                color: Colors.red,
                thickness: 5,
              ),
              const SizedBox(height: 10),
              const Text('Convert from Watt to Horse Power',
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Mywidget(controller: _whcontroller),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){WTH();},
                      child: const Text('Convert',style: TextStyle(fontSize: 25,color: Colors.red),)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 33),
                  Text('Watt to Horse ($_result2)'),
                ],
              ),
              const Divider(
                color: Colors.red,
                thickness: 5,
              ),
              const SizedBox(height: 10),
              const Text('Convert from Kilo to Watt',
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Mywidget( controller: _kwcontroller),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){KTW();},
                      child: const Text('Convert',style: TextStyle(fontSize: 25,color: Colors.red),)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 33),
                  Text('Kilo to Watt ($_result3)'),                ],
              ),
              const Divider(
                color: Colors.red,
                thickness: 5,
              ),
              const SizedBox(height: 10),
              const Text('Convert from Horse Power to Watt',
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Mywidget(controller: _hwcontroller),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){HTW();},
                      child: const Text('Convert',style: TextStyle(fontSize: 25,color: Colors.red),)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 33),
                  Text('Horse to killo ($_result4)'),
               ],
              ),
              const Divider(
                color: Colors.red,
                thickness: 5,
              ),
            ],
          ),
        ),
      )
    );
  }
}
class Mywidget extends StatelessWidget {
  TextEditingController controller;

  Mywidget({required this.controller,super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox( width:250.0,height:50.9,
      child:TextField(
        controller: controller,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d{0,9}\.?\d{0,4}')),],
        keyboardType:const  TextInputType.numberWithOptions(decimal: true),
        style: TextStyle(fontSize: 10),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Only Number is allowed',
        ),
      ),
    );
  }
}

