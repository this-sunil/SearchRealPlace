import 'package:evigenie/DashBoardPage.dart';
import 'package:flutter/material.dart';
class ResigterVehicle extends StatefulWidget {
  const ResigterVehicle({Key? key}) : super(key: key);

  @override
  State<ResigterVehicle> createState() => _ResigterVehicleState();
}
class _ResigterVehicleState extends State<ResigterVehicle> {
  List<String> companyList=[
    "Tata Motors",
     'Mahindra',
      "Hyundai",
     "MG Motors",
      "Jaguar",
     "Mercedes",
      "Audi",
    "Porsche",
  ];
  List<String> modelList=[
    "E-Tigor",
    'Nexon EV',
    "Tigor EV Ziptron",
    "E-Verito",
    "e20 Plus 8",
    "Kona",
    "Zs EV",
    "I-PACE",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color(0xFF0288D1),
                Color(0xFF0277BD),
                Color(0xFF01579B),
              ],
            ),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Vehicle Info',style: TextStyle(color: Colors.white,fontSize: 40),),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text('Please provide your vehicle information',style: TextStyle(color: Colors.white,fontSize: 15),),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60)
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                            children: [
                              SizedBox(height: 60,),
                              Container(
                                decoration: BoxDecoration(
                                    color:Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow:[BoxShadow(
                                        color: Color.fromARGB(225, 95, 27, 3),
                                        blurRadius: 20,
                                        offset: Offset(0,10)
                                    )
                                    ] ),
                              ),
                             Row(
                               children: [
                                 Text('Make',style: TextStyle(color: Colors.grey),),
                               ],
                             ),
                             DropdownButtonFormField(items: companyList.map((e){
                               return DropdownMenuItem(
                                 value: e,
                                   child: Text(e));
                             }).toList(), onChanged: (value){}),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  Text('Model',style: TextStyle(color: Colors.grey),),
                                ],
                              ),
                              DropdownButtonFormField(items: modelList.map((e){
                                return DropdownMenuItem(
                                    value: e,
                                    child: Text(e));
                              }).toList(), onChanged: (value){}),
                              SizedBox(height: 20,),
                              TextField(
                                decoration: InputDecoration(
                                    suffixIcon:Icon(Icons.info_outline),
                                    labelText: 'Vehicle Registration Num..'
                                ),
                              ),
                              SizedBox(height: 20,),
                              TextField(
                                decoration: InputDecoration(
                                    suffixIcon:Icon(Icons.info_outline,),
                                    labelText: 'VIN'
                                ),
                              ),
                              SizedBox(height: 30,),
                              SizedBox(
                                width: 280,
                                child: ElevatedButton(
                                  style: ButtonStyle( shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50,vertical: 15)),
                                    backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                                  ),
                                  onPressed: () {
                                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardPage()));
                                  },
                                  child:
                                      const Text('Next', style: TextStyle(fontSize: 20)),

                                  ),
                                ),

                            ]  ),
                      ),
                    ),
                  ),
                ),
              ]
          ),
        ),
    );
  }
}
