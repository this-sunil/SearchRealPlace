import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import 'Profile.dart';
class Routeplanner extends StatefulWidget {
  const Routeplanner({Key? key}) : super(key: key);

  @override
  State<Routeplanner> createState() => _RouteplannerState();
}

class _RouteplannerState extends State<Routeplanner> {
  int _selectedItem =0;
  bool istoll = false;
  bool isHighway = false;
  var textValue = 'Switch is OFF';
  void toggleToll(bool value) {

    if(istoll == false)
    {
      setState(() {
        istoll = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        istoll = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }
  void toggleHighway(bool value) {

    if(isHighway == false)
    {
      setState(() {
        isHighway= true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        isHighway = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Route Planner',style: TextStyle(fontSize: 25,color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text('Plan your route',style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    IconButton(
                      icon:Icon(Icons.circle,color: Colors.blue,),
                      onPressed: (){},
                    ),
                    Expanded(
                      child:  TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: Container(
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border:Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius:BorderRadius.circular(5)
                            ),
                            width: 70,
                            child: Row(
                              children: [
                                Icon(Icons.battery_full_outlined,color: Colors.green,),
                                Text('100%',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),)
                              ],
                            ),),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: 'Your Location',

                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.location_on,color: Colors.red,),
                      onPressed: (){},
                    ),
                    Expanded(
                      child:  TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              suffixIcon: Container(
                                margin: EdgeInsets.all(8),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border:Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius:BorderRadius.circular(5)

                                ),
                                width: 70,
                                child: Row(
                                  children: [
                                    Icon(Icons.battery_full_sharp,color: Colors.red,),
                                    Text('20%',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),

                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              hintText: 'Destination'
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_upward_outlined),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Settings',style: TextStyle(fontSize: 20,)),
                  ],
                ),
              ),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.car_repair,color: Colors.blue,),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('E Vehicle'),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.toll,color: Colors.blue,),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Avoid Tolls'),
                          ),
                        ],
                      ),
                      Column(
                        children: [Transform.scale(
                          scale: 1,
                          child:Switch(
                            onChanged: toggleToll,
                            value: istoll,
                            activeColor: Colors.white,
                            activeTrackColor: Colors.green,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Colors.green,
                          ),
                        ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.add_road,color: Colors.blue,),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Avoid Highways'),
                          ),
                        ],
                      ),
                      Column(
                        children: [Transform.scale(
                          scale: 1,
                          child:Switch(
                            onChanged: toggleHighway,
                            value: isHighway,
                            activeColor: Colors.white,
                            activeTrackColor: Colors.green,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Colors.green,
                          ),
                        ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Icon(Icons.person,color: Colors.blue,),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Maximum Speed'),
                          ),
                        ],
                      ),
                      Text('_ _ Km/h'),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Reduce Your Speed To Increase Your Range"),
                  ),
                  // Icon(Icons.question_mark)
                ],
              ),
              SizedBox(height: 3,),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) =>Profile ()));
                  },
                  child:
                  Text('Start', style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 40,)
            ]
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type:BottomNavigationBarType.fixed ,
        items:<BottomNavigationBarItem> [
          BottomNavigationBarItem(icon:Icon(Icons.home,color: Colors.black,),label: 'home'),
          BottomNavigationBarItem(icon:Icon(Icons.location_on,color: Colors.black,),label: 'locat'),
          BottomNavigationBarItem(icon:Icon(Icons.person_add_alt_1,color: Colors.black,),label: 'person'),
          BottomNavigationBarItem(icon:Icon(Icons.person,color: Colors.black,),label: 'profile'),
        ],
        currentIndex: _selectedItem,
        onTap:(setValue){
          setState((){
            _selectedItem =setValue;
          });

        },
      ),
    );

  }
}
