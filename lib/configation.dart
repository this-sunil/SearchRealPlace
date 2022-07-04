import 'package:flutter/material.dart';
Color  color =Color(0xff416d6d);
List<BoxShadow> shadowList =[
  BoxShadow(color: Colors.grey,blurRadius: 30,offset:Offset (0, 10))
];
List<Map<String,dynamic>> categories =[
  {'name':'cat','iconpath':'images/wifiIcon-removebg-preview.png'},
  {'name':'dog','iconpath':'images/pizaa-removebg-preview.png'},
  {'name':'horse','iconpath':'images/shopping-removebg-preview.png'},
  {'name':'parrot','iconpath':'images/petHome-removebg-preview.png'},
  {'name':'rabbit','iconpath':'images/icon-removebg-preview.png'},
];
List<Icon> iconData=[
  Icon(Icons.wifi,color: Colors.white),
  Icon(Icons.food_bank_outlined,color: Colors.white),
  Icon(Icons.shopping_cart_outlined,color: Colors.white),
  Icon(Icons.pets,color: Colors.white),
  Icon(Icons.person,color: Colors.white),
];

