import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Bytes_constructor.dart';

class Bytespage extends StatefulWidget {
  const Bytespage({super.key});

  @override
  State<Bytespage> createState() => _BytespageState();
}

class _BytespageState extends State<Bytespage> {
TextEditingController _value = TextEditingController();
String from = '';
String to = '';
double result=0;
int? SelectedValue;

double BytesConverCalculator(int i){
  return i*1;
}

void Totalresult(){
  try{
    setState(() {
      double z = double.parse(_value.text);
      double BCC = BytesConverCalculator(SelectedValue ?? 0);
      Bytes bytes = Bytes();
      if(BCC == 0 ){
        result=0;
      }else if(BCC == 1){
        result = bytes.bitsToBytes(z);
      }else if(BCC == 2){
        result = bytes.bytesToKilobytes(z);
      }else if(BCC == 3){
        result = bytes.kilobytesToMegabytes(z);
      }else if(BCC == 4){
        result = bytes.megabytesToGigabytes(z);
      }else if(BCC == 5){
        result = bytes.gigabytesToTerabytes(z);
      }else if(BCC == 6){
        result = bytes.kilobytesToBytes(z);
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
        title: Text('Bytes Convert'),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
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
                        from = 'Bits';
                        to = 'Bytes';
                      });
                    }),
                const Text('Bits To Bytes',style: TextStyle(fontSize: 15)),
              ],
            ),
            Row(
              children: [
                Radio(value: 2,
                    groupValue: SelectedValue,
                    onChanged: (int? value){
                      setState(() {
                        SelectedValue = 2 ;
                        from = 'Bytes';
                        to = 'KilloBytes';
                      });
                    }),
                const Text('Bytes To KilloBytes',style: TextStyle(fontSize: 15)),
              ],
            ),
            Row(
              children: [
                Radio(value: 3,
                    groupValue: SelectedValue,
                    onChanged: (int?value){
                      setState(() {
                        SelectedValue=3;
                        from='Kilobytes';
                        to='Megabytes';
                      });
                    }),
                const Text('Killobytes To Megabytes',style: TextStyle(fontSize: 15)),
              ],
            ),
            Row(
              children: [
                Radio(value: 4,
                    groupValue: SelectedValue,
                    onChanged: (int ? value){
                      setState(() {
                        SelectedValue=4;
                        from='Megabytes';
                        to='Gigabytes';
                      });
                    }),
                const Text('Megabytes To Gigabytes',style: TextStyle(fontSize: 15)),
              ],
            ),
            Row(
              children: [
                Radio(value: 5,
                    groupValue: SelectedValue,
                    onChanged: (int ? value){
                      setState(() {
                        SelectedValue=5;
                        from='Gigabytes';
                        to='Terabytes';
                      });
                    }),
                const Text('Gigabytes To Terabytes',style: TextStyle(fontSize: 15)),
              ],
            ),
            Row(
              children: [
                Radio(value: 6,
                    groupValue: SelectedValue,
                    onChanged: (int ? value){
                      setState(() {
                        SelectedValue=6;
                        from='Kilobytes';
                        to='Bytes';
                      });
                    }),
                const Text('Kilobytes To Bytes',style: TextStyle(fontSize: 15)),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: (){Totalresult();},
              child:const Text('Convert',style: TextStyle(fontSize: 25,color: Colors.lightGreenAccent)),
            ),
            const Divider(
              color: Colors.lightGreenAccent,
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
              child: Image.network('https://images.unsplash.com/photo-1601737487795-dab272f52420?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              width: MediaQuery.of(context).size.width*1,
              height:MediaQuery.of(context).size.height*0.23,
              fit: BoxFit.cover,),
            ),
            const Divider(
              color: Colors.lightGreenAccent,
              thickness: 5,
            )
          ],
        ),
      ),

    );
  }
}
