import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:evigenie/ResigterVehicle.dart';
import 'package:evigenie/Route%20Planner.dart';
import 'package:evigenie/configation.dart';
import 'package:evigenie/profile/RFIDPage.dart';
import 'package:flutter/material.dart';

import 'service/SearchPlace.dart';
class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Category> categories =[
    Category(name: "cat", iconPath: "images/wifiIcon-removebg-preview.png"),

    Category(name:'dog',iconPath:'images/pizaa-removebg-preview.png'),

    Category(name:'horse',iconPath:'images/shopping-removebg-preview.png'),
    Category(name:'parrot',iconPath:'images/petHome-removebg-preview.png'),
    Category(name:'rabbit',iconPath:'images/icon-removebg-preview.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(

         
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RFIDPage()));
            }, icon: Icon(Icons.share)),
              IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ResigterVehicle()));
            },
          ),
          expandedHeight: 300,
          floating: true,
          pinned: true,
          collapsedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(

            background: Carousel(
              dotSize: 4,
              images: [
                Image.asset('images/car dashbord.jpg', fit: BoxFit.cover),
                Image.asset('images/car.jpg', fit: BoxFit.cover),
                Image.asset('images/mahindra.jpg', fit: BoxFit.cover),
                Image.asset('images/car123.jpg', fit: BoxFit.cover),
              ],
            ),
          ),
          ),
          SliverToBoxAdapter(
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: iconData.map((e){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade400,
                      maxRadius: 25,
                      child: e,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('EV Charging Station',style:Theme.of(context).textTheme.headline6),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('MG Road,Pune')
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Connectors',style:Theme.of(context).textTheme.headline5),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(

              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context,index){
                  return  Card(
                    color: Color(0xFFE0F7FA),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('3Pin'),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 60),
                          child: Icon(Icons.charging_station,size: 60,color: Colors.blue),
                        ),
                        Text('--Kwh'),
                      ],
                    ),
                  );
                },

              ),
            ),
          ),
          SliverToBoxAdapter(
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Open',style: TextStyle(fontSize: 18,color: Colors.green),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('9:00 AM-11:00 PM',style: TextStyle(fontSize: 18,color: Colors.black),
                    ),
                  ),

                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.location_on,color: Colors.blue,),
                  Text('5.2 Km'),
                  SizedBox(width: 40,),
                  Icon(Icons.watch_later_outlined),
                  Text(' 30Mins'),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.location_on,color: Colors.blue,),
                  Text('No. 123, 10th  Main, MG  Road  Pune',style: TextStyle(fontSize: 16),),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    padding:MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 70,vertical: 15)),
                    backgroundColor:
                    MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchPlace()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_searching_outlined),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:8.0),
                        child: Text('Direction', style: const TextStyle(fontSize: 20)),
                      ),
                    ],
                  ),
                ),
                OutlinedButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(color: Colors.blue))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 8),
                      child:  Center(child: Icon(Icons.qr_code_scanner,color: Colors.black,)),
                    ),
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Routeplanner()));
                    })
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          
        ],
      ),
    );
  }
}
class Category{
  final String name;
  final String iconPath;
  Category({required this.name,required this.iconPath});
}
