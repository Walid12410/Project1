import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Area_constructor.dart';


class Areapage extends StatefulWidget {
  const Areapage({super.key});

  @override
  State<Areapage> createState() => _AreapageState();
}

class _AreapageState extends State<Areapage> {
  TextEditingController _value = TextEditingController();
  int? SelectedValue;
  String from= '';
  String to = '';
  double result = 0;

  double AreaConvertCalulator(int i){
    return i*1;
  }

  void TotalResult(){
    try{
      setState(() {
        double z =double.parse(_value.text);
        Area area = Area();
        double ACC = AreaConvertCalulator(SelectedValue??0);
        if(ACC == 0){
          result = 0;
        }else if(ACC == 1){
          result = area.metersToFeet(z);
        }else if (ACC == 2){
          result = area.feetToMeters(z);
        }else if (ACC == 3){
          result = area.squareMetersToAcres(z);
        }else if(ACC == 4){
          result = area.acresToSquareMeters(z);
        }
      });
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Enter a valid number'),
        duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void clearfield(){
    setState(() {
      SelectedValue = null;
      result = 0;
      from = '';
      to = '';
      _value.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area Convert'),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
        actions: [
          Tooltip(
            message: 'reset',
            child: IconButton(
              onPressed: (){clearfield();},
              icon: const Icon(
                Icons.restart_alt,
              ),
            ),
          )
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
                SizedBox(width:350,height:50.0,
                  child:TextField(
                    controller: _value,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d{0,9}\.?\d{0,4}')),],
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),style: TextStyle(fontSize: 10),
                    decoration: const  InputDecoration(
                      border:  OutlineInputBorder(),
                      hintText: 'Only Number is allowed',
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
                    from = 'Meter';
                    to = 'Feet';
                  });
                    }),
                const Text('Meters To Feet',style: TextStyle(fontSize: 15)),
              ],
            ),
            Row(
              children: [
                Radio(value: 2,
                    groupValue: SelectedValue,
                    onChanged: (int? value){
                  setState(() {
                    SelectedValue = 2 ;
                    from = 'Feet';
                    to = 'Meters';
                  });
                    }),
                const Text('Feet To Meters',style: TextStyle(fontSize: 15)),
              ],
            ),
            Row(
              children: [
                Radio(value: 3,
                    groupValue: SelectedValue,
                    onChanged: (int?value){
                  setState(() {
                    SelectedValue=3;
                    from='SquareMeters';
                    to='Acres';
                  });
                    }),
                const Text('SquareMeters To Acres',style: TextStyle(fontSize: 15)),
              ],
            ),
            Row(
              children: [
                Radio(value: 4,
                    groupValue: SelectedValue,
                    onChanged: (int ? value){
                  setState(() {
                    SelectedValue=4;
                    from='Acres';
                    to='SquareMeters';
                  });
                    }),
                const Text('Acres To SquareMeters',style: TextStyle(fontSize: 15)),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: (){TotalResult();},
                child:const Text('Convert',style: TextStyle(fontSize: 25,color: Colors.cyanAccent)),
            ),
             const Divider(
              color: Colors.cyanAccent,
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
                    padding: EdgeInsets.all(10.0),
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
            const SizedBox(height: 10,),
            Expanded(
              child: Image.network('https://images.unsplash.com/photo-1559329389-cc3eb9ed49b1?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                width: MediaQuery.of(context).size.width*1,
                height: 200,
                fit: BoxFit.cover,),
            ),
            const Divider(
              color: Colors.cyanAccent,
              thickness: 5,
            ),
          ],
        ),
      )
    );
  }
}
