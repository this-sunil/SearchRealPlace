import 'package:evigenie/DashBoardPage.dart';
import 'package:evigenie/service/CurrentLocation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'SplashScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => print("Firebase Connected ${value.isAutomaticDataCollectionEnabled}"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CurrentLocation>(
      create: (context)=>CurrentLocation(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'evigenie',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
