import 'package:evigenie/SavedCharger.dart';
import 'package:flutter/material.dart';
class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("EV Charging Station",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on,color: Colors.lightBlueAccent,),
                Text('No. 123, 10th  Main, MG  Road  Pune',style: TextStyle(fontSize: 15),),
              ],
            ),
            SizedBox(height: 15,),
            SizedBox(
              width: 280,
              child: OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  side: MaterialStateProperty.all(BorderSide(color:Colors.blue),),
                  backgroundColor:
                  MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (context) =>Wallet ()));
                },
                child:
                Text('Charger Type | CCS-2', style: TextStyle(fontSize: 10,color: Colors.black)
                ),
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 45.0,
                        backgroundColor: Color(0xFFE0F7FA),
                        child: Icon(Icons.charging_station_outlined,size: 50,color: Colors.lightBlueAccent,),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20,),
                Column(
                  children: [
                    Row(
                      children: [
                        Text("CCS-2",style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Row(
                      children: [
                        Text('₹ 99/Kwh',style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    )
                  ],
                ),
              ],

            ),
            SizedBox(height: 20,),
            Container(
              height: 65,
              width: 230,
              color: Color(0xFFE0F7FA),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Icon(Icons.account_balance_wallet_outlined,size:25,color: Colors.lightBlueAccent,),
                  ),
                  Text('Wallet',style: TextStyle(fontSize: 18,color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text('₹ 0.0',style: TextStyle(fontSize: 20,color: Colors.red),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text('Charging Estimate',style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10,),
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.currency_rupee,color: Color(0xFF26C6DA)),
                  Text("Estimated Amount",style: TextStyle(fontSize: 15,color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('₹ 300.00',style: TextStyle(fontSize: 20,color: Colors.black),),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Divider(
                color: Colors.black,
              ),
            ),
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.currency_rupee,color:Colors.lightBlueAccent,),
                  Text("Estimated Units",style: TextStyle(fontSize: 15,color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('   16.67 Kwh',style: TextStyle(fontSize: 20,color: Colors.black),),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15),
              child: Divider(
                color: Colors.black,
              ),
            ),
            Flexible(
              flex: 5,
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(10.0),),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    backgroundColor:
                    MaterialStateProperty.all(Colors.blue,),
                  ),
                  onPressed: () {
                     Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) =>SavedCharger()));
                  },
                  child:
                  Text('Proceed', style: TextStyle(fontSize: 15)),
                ),
              ),
            ),
          ],
        ),


      ),

    );
  }
}
