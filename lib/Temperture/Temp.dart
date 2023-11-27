import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Temp_constructor.dart';

class Temperturepage extends StatefulWidget {
  const Temperturepage({super.key});

  @override
  State<Temperturepage> createState() => _TemperturepageState();
}

class _TemperturepageState extends State<Temperturepage> {

  TextEditingController _value = TextEditingController();
  String from = '';
  String to = '';
  double result=0;
  int? SelectedValue;

  double TempConverCalculator(int i){
    return i*1;
  }

  void Totalresult(){
    try{
      setState(() {
        double z = double.parse(_value.text);
        double TCC = TempConverCalculator(SelectedValue ?? 0);
        Temp temp = Temp();
        if(TCC == 0 ){
          result=0;
        }else if(TCC == 1){
          result = temp.celsiusToFahrenheit(z);
        }else if(TCC == 2){
          result = temp.fahrenheitToCelsius(z);
        }else if(TCC == 3){
          result = temp.celsiusToKelvin(z);
        }else if(TCC == 4){
          result = temp.kelvinToCelsius(z);
        }else if(TCC == 5){
          result = temp.fahrenheitToKelvin(z);
        }else if(TCC == 6){
          result = temp.kelvinToFahrenheit(z);
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
      SelectedValue = null;
      _value.clear();
      result=0;
      from='';
      to='';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperture Convert'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
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
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Convert from $from To $to'),
              ],
            ),
            SizedBox(width: 350,height: 50,
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
            Row(
              children: [
                Radio(value: 1,
                    groupValue: SelectedValue,
                    onChanged: (int? value){
                      setState(() {
                        SelectedValue = 1;
                        from = 'Celsius';
                        to = 'Fahrenheit';
                      });
                    }),
                const Text('Celsius To Fahrenheit',style: TextStyle(fontSize: 15)),
              ],
            ),
            Row(
              children: [
                Radio(value: 2,
                    groupValue: SelectedValue,
                    onChanged: (int? value){
                      setState(() {
                        SelectedValue = 2 ;
                        from = 'Fahrenheit';
                        to = 'Celsius';
                      });
                    }),
                const Text('Fahrenheit To Celsius',style: TextStyle(fontSize: 15)),
              ],
            ),
            Row(
              children: [
                Radio(value: 3,
                    groupValue: SelectedValue,
                    onChanged: (int?value){
                      setState(() {
                        SelectedValue=3;
                        from='Celsius';
                        to='Kelvin';
                      });
                    }),
                const Text('Celsius To Kelvin',style: TextStyle(fontSize: 15)),
              ],
            ),
            Row(
              children: [
                Radio(value: 4,
                    groupValue: SelectedValue,
                    onChanged: (int ? value){
                      setState(() {
                        SelectedValue=4;
                        from='Kelvin';
                        to='Celsius';
                      });
                    }),
                const Text('Kelvin To Celsius',style: TextStyle(fontSize: 15)),
              ],
            ),
            Row(
              children: [
                Radio(value: 5,
                    groupValue: SelectedValue,
                    onChanged: (int ? value){
                      setState(() {
                        SelectedValue=5;
                        from='Fahrenheit';
                        to='Kelvin';
                      });
                    }),
                const Text('Fahrenheit To Kelvin',style: TextStyle(fontSize: 15)),
              ],
            ),
            Row(
              children: [
                Radio(value: 6,
                    groupValue: SelectedValue,
                    onChanged: (int ? value){
                      setState(() {
                        SelectedValue=6;
                        from='Kelvin';
                        to='Bytes';
                      });
                    }),
                const Text('Kilobytes To Bytes',style: TextStyle(fontSize: 15)),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: (){Totalresult();},
              child:const Text('Convert',style: TextStyle(fontSize: 25,color: Colors.deepOrange)),
            ),
            const Divider(
              color: Colors.deepOrange,
              thickness: 5,
            ),
            Row(
              children: [
                const Text('Result',style: TextStyle(fontSize: 25),),
                const SizedBox(width: 15),
                Expanded(
                  child: Container(
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
                )
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Image.network('https://images.unsplash.com/photo-1634029859957-01b6d9139e2a?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                width: MediaQuery.of(context).size.width*1,
                height:MediaQuery.of(context).size.height*0.23,
                fit: BoxFit.cover,),
            ),
            const Divider(
              color: Colors.deepOrange,
              thickness: 5,
            )
          ],
        ),
      ),

    );
  }
}
