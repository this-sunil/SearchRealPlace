import 'package:flutter/material.dart';
import 'package:evigenie/Singin.dart';

import 'Profile.dart';
import 'Route Planner.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SingIn())));
    _controller =AnimationController(vsync: this,
    );}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'images/car-sensor-animation-mobile.gif',
            ),
          ),
           SizedBox(height: 25,),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('ev',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green),),
               Text('Jgenie',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
             ],
           ),

    ]
      ),
      );
  }
}
