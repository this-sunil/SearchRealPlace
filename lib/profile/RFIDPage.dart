

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
class RFIDPage extends StatefulWidget {
  const RFIDPage({Key? key}) : super(key: key);

  @override
  State<RFIDPage> createState() => _RFIDPageState();
}

class _RFIDPageState extends State<RFIDPage> {
  final SwiperController swiperController=SwiperController();
  int currentIndex=0;
  bool flag=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("RFID",style: Theme.of(context).textTheme.headline5),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text("How to Use?",style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left:8.0,right: 8.0),
              child: Swiper(
                itemCount:3,
                itemWidth: 350,
                itemHeight: 200,

                index: currentIndex,
                axisDirection: AxisDirection.left,
                customLayoutOption: CustomLayoutOption(
                  startIndex: 0,
                  stateCount: 3,
                ),
                controller: swiperController,
                layout: SwiperLayout.TINDER,
                scrollDirection: Axis.horizontal,
                indicatorLayout: PageIndicatorLayout.SLIDE,

                pagination: const SwiperPagination(
                    margin: EdgeInsets.only(bottom: 0),
                    alignment: Alignment.bottomCenter),

                onIndexChanged: (int index){
                  setState(() {
                    currentIndex=index;
                  });
                },
                itemBuilder: (context,index){
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Colors.grey.shade200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Step ${index+1}",style: Theme.of(context).textTheme.headline5),
                       Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: index==0?Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: const [
                                Text("Just tap your RFID on the scanner at"),
                                Center(child: Text("the charger")),
                              ],
                            ),
                          ):index==1?Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("We Have got you covered, just wait"),
                              Text("for your car to be charged.")
                            ],
                          )):Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Just tab to stop charging and you are"),
                                Center(child: Text("ready to go.")),
                              ],
                            ),

                          )),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          Flexible(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Linked RFIDs",style: Theme.of(context).textTheme.titleSmall),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("images/stripe.png"),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
