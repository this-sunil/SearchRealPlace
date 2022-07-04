import 'package:flutter/material.dart';
class SavedCharger extends StatefulWidget {
  const SavedCharger({Key? key}) : super(key: key);
  @override
  State<SavedCharger> createState() => _SavedChargerState();
}
class _SavedChargerState extends State<SavedCharger> {
  List<String> items=[

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Saved Charger',style: TextStyle(color: Colors.black),),),
      body:ListView.builder(
          itemCount: 2,
          itemBuilder:(context,index){
            return Card(
              shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
              elevation: 10,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset('images/car.jpg',width: 90,),
                            Divider(),
                            Text('Connectors',style: TextStyle(fontSize: 15),),

                            Icon(Icons.charging_station),
                            Text('CCS-2'),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Bhajan Singh Da Dhabha",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.bookmark,color: Colors.red,),
                              ),
                            ],
                          ),
                          Text('Talegaon Dabhade'),
                          SizedBox(height: 50,),
                        ],
                      ),


                    ],
                  ),
                ],
              ),
            );

          }),
    );
  }
}
