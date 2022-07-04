import 'package:evigenie/Wallet.dart';
import 'package:evigenie/profile/RFIDPage.dart';
import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedItem =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Profile',style: TextStyle(fontSize: 25,color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage:AssetImage('images/persone_Icon-removebg-preview.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Text('User Name',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Email Id | Moblie Number',style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Text('Refundable Deposit',style: TextStyle(fontSize: 12,color: Colors.blue,fontWeight: FontWeight.bold),
                      ),

                    ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person,color: Colors.blue,),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Personal Details'),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
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
                            child: Text('My Vehicle'),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.charging_station_outlined,color: Colors.blue,),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Charginng History'),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RFIDPage()));
                },
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.voice_chat_outlined,color: Colors.blue,),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Manage RFID'),
                            ),
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(Icons.logout,color: Colors.blue,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Logout'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 300,
                child: OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) =>Wallet()));
                  },
                  child:
                  Text(' SHARE', style: TextStyle(fontSize: 20,color: Colors.red)
                  ),
                ),
              ),
              IntrinsicHeight(
                child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Privacy Policy ',style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: VerticalDivider(
                          color: Colors.black,
                          thickness: 2,
                          indent: 10,
                        ),
                      ),
                      Text('Terms Of Use',style:TextStyle(color: Colors.blue) ,),
                    ]),
              ),
            ],
          ),
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
