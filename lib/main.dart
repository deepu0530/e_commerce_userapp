import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_commerce/screens/authentication/login.dart';
import 'package:e_commerce/screens/dashboard/home_screen/home.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(
        
        primarySwatch: Colors.orange,
      ),
      home:AnimatedSplashScreen(
        backgroundColor: Colors.orange,
      splash: Icon(Icons.shopping_bag,color: Colors.white,size: 100,),
      nextScreen: LoginScreen(),
    
      splashTransition: SplashTransition.rotationTransition,
      
    ),
    );

  }
}

//  _display()async{
// if(await FirebaseAuth.instance.currentUser!=null){
// Route route = MaterialPageRoute(builder: (_)=>Home());
// Navigator.pushReplacement(context, route);
// }
// else{
//   Route route = MaterialPageRoute(builder: (_)=>LoginScreen());
// Navigator.pushReplacement(context, route);
// }


// }
