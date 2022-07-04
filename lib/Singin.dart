import 'package:evigenie/OtpScreen.dart';
import 'package:flutter/material.dart';
//import 'Otp.dart';
class SingIn extends StatefulWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  State<SingIn> createState() => _SingInState();
}
class _SingInState extends State<SingIn> {
  TextEditingController phone=TextEditingController();
  final GlobalKey<FormState> formKey=GlobalKey<FormState>();
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
      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blue,
              Colors.blueAccent,
              Colors.lightBlue,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Login',style: TextStyle(color: Colors.white,fontSize: 40),),
                  SizedBox(height: 10,),
                  Text('Welcome Back',style: TextStyle(color: Colors.white,fontSize: 18),),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60)
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                        controller: phone,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(

                            filled: true,
                            fillColor: Colors.white,
                            hintText: ' Mobile Number',

                            // labelText: 'Email',
                            prefixIcon: Icon(
                              Icons.call,
                              color: Colors.grey,
                             ),
                         ),
                         ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(

                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(5),
                            shadowColor: MaterialStateProperty.all(Colors.lightBlue),
                            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 80,vertical: 15)),
                            backgroundColor:
                            MaterialStateProperty.all(Colors.lightBlue),
                          ),
                          onPressed: () {
                            if(phone.text.isNotEmpty){
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) => OtpScreen("sunil", "swa@gmail.com", phone.text, "+91")));
                            }

                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
           ]  ),
          ),
            ),
           ] ),
      )
      );
  }
}
