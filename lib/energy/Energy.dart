import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Energy_constructor.dart';


class Energypage extends StatefulWidget {
  const Energypage({super.key});

  @override
  State<Energypage> createState() => _EnergypageState();
}

class _EnergypageState extends State<Energypage> {
  final TextEditingController _value = TextEditingController();
  int? SelectedValue;
  double result=0;

  double EnergyConvertCalculate(int i){
    return i*1;
  }

  void TotalResult(){
    try{
      setState(() {
        double z = double.parse(_value.text);
        Energy energy = Energy();
        double ECC= EnergyConvertCalculate(SelectedValue??0);
        if(ECC == 0){
          result = 0;
        }else if(ECC == 1){
          result = energy.SoundTOElectrical(z);
        }else if(ECC == 2){
          result = energy.heatToElectrical(z);
        }else if(ECC == 3){
          result = energy.motionToElectrical(z);
        }else if(ECC ==4){
          result = energy.mechanicalToElectrical(z);
        }
      });
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please Enter a valid number'),
            duration: Duration(seconds: 2),),
      );
    }
  }
  void clearfield(){
    setState(() {
      _value.clear();
      result=0;
      SelectedValue=null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Energy Convert'),
        titleTextStyle: const TextStyle(fontSize: 19),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          Tooltip(
            message: 'reset',
            child:IconButton(
              onPressed: (){
                clearfield();
              },
              icon: const Icon(
                Icons.restart_alt,
              )
            )
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text('Convert To Electric',style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
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
                const SizedBox(width: 15),
                Radio(value: 1,
                    groupValue: SelectedValue,
                    onChanged: (int? value){
                    setState(() {
                      SelectedValue=1;
                    });
                    }),
                const Text('Sound to Electrical',style: TextStyle(fontSize: 15)),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 15),
                Radio(value: 2,
                    groupValue: SelectedValue,
                    onChanged: (int ? value){
                  setState(() {
                    SelectedValue=2;
                  });
                  }),
                const Text('Heat To Electrical',style: TextStyle(fontSize: 15)),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 15),
                Radio(value: 3,
                    groupValue: SelectedValue,
                    onChanged: (int?value){
                  setState(() {
                    SelectedValue=3;
                  });
                    }),
                const Text('Motion To Electrical',style: TextStyle(fontSize: 15)),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 15),
                Radio(value: 4,
                    groupValue: SelectedValue,
                    onChanged: (int ? value){
                  setState(() {
                    SelectedValue=4;
                  });
                    }),
                const Text('Mechanical To ELectrical',style: TextStyle(fontSize: 15)),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: (){TotalResult();},
                child: Text('Convert',style: TextStyle(fontSize: 25,color: Colors.blue))
            ),
            const SizedBox(height: 20),
            const Divider(
              color: Colors.blue,
              thickness: 5,
            ),
            Row(
              children: [
              Text('Result $result',style: TextStyle(fontSize: 25)),
              const SizedBox(height: 20),
              ],
            ),
            Expanded(
              child: Image.network('https://images.unsplash.com/photo-1454779132693-e5cd0a216ed3?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                width:  MediaQuery.of(context).size.width*1,
                height: MediaQuery.of(context).size.height*0.15,
                fit: BoxFit.cover,
              ),
            ),
            const Divider(
             color: Colors.blue,
             thickness: 5,
            )
          ],
        ),
      ),
    );
  }
}


