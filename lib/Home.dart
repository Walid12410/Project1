import 'package:flutter/material.dart';
import 'power/Powerpage.dart';
import 'energy/Energy.dart';
import 'Area/Area.dart';
import 'Byte/Byte.dart';
import 'Speed/Speed.dart';
import 'Temperture/Temp.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversion Application'),
        titleTextStyle: const TextStyle(fontSize: 15),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        actions: [
          Tooltip(
            message: 'Speed',
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Speedpage()),
                );
                },
              icon: const Icon(
                Icons.speed,
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.yellow,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network('https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        width: 250,
                        height: 250,
                      fit: BoxFit.cover,),
                    ),
                    const Text(
                      'Conversion Application',
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.energy_savings_leaf,
                ),
                title: const Text('Energy Convert'),
                onTap: () {
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context)=>Energypage()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.power,
                ),
                title: const Text('Power Convert'),
                onTap: () {
                   Navigator.push(context,
                     MaterialPageRoute(builder: (context)=>Powerpage()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.thermostat,
                ),
                title: const Text('Temperture Convert'),
                onTap: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Temperturepage()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.speed,
                ),
                title: const Text('Speed Convert'),
                onTap: () {
                    Navigator.push(context,
                     MaterialPageRoute(builder: (context)=>Speedpage()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.area_chart,
                ),
                title: const Text('Area Convert'),
                onTap: () {
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context)=>Areapage()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.computer,
                ),
                title: const Text('Bytes Convert'),
                onTap: () {
                  Navigator.push(context,
                     MaterialPageRoute(builder: (context)=>Bytespage()));
                },
              ),
            ],
          ),
        ),
      ),
      body:Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.red, // Border color
                            // width: 2.0, // Border width
                        ),
                      ),
                        child: IconButton(
                          onPressed: () {
                           Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Powerpage()));
                        },
                          icon: const Icon(
                          Icons.power,
                          size: 120,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    const Text('Power Convert',style: TextStyle(fontSize: 20)),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue, // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                         Navigator.push(context,
                           MaterialPageRoute(builder: (context) => Energypage()));
                        },
                        icon: const Icon(
                          Icons.energy_savings_leaf,
                          size: 120,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const Text('Energy Convert' , style: TextStyle(fontSize: 20),)
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.lightGreenAccent, // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                           Navigator.push(context,
                           MaterialPageRoute(builder: (context) => Bytespage()));
                        },
                        icon: const Icon(
                          Icons.computer,
                          size: 120,
                          color: Colors.lightGreenAccent,
                        ),
                      ),
                    ),
                    const Text('Bytes Convert',style: TextStyle(fontSize: 20)),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.cyanAccent, // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                           Navigator.push(context,
                           MaterialPageRoute(builder: (context) => Areapage()));
                        },
                        icon: const Icon(
                          Icons.area_chart,
                          size: 120,
                          color: Colors.cyanAccent,
                        ),
                      ),
                    ),
                    const Text('Area Convert',style: TextStyle(fontSize: 20)),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.greenAccent, // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                           Navigator.push(context,
                           MaterialPageRoute(builder: (context) => Speedpage()));
                        },
                        icon: const Icon(
                          Icons.speed,
                          size: 120,
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                    const Text('Speed Convert',style: TextStyle(fontSize: 20)),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.deepOrange, // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                           Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Temperturepage()));
                        },
                        icon: const Icon(
                          Icons.thermostat,
                          size: 120,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                    const Text('Temp Convert' , style: TextStyle(fontSize: 20),)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      )
    );
  }
}
