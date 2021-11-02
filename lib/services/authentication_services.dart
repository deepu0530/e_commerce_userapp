
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future CreateNewUser(String name, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      
     
      return user;
    } catch (e) {
      print(e.toString());
    }
  }
  //login with email and password
  Future login(String email, String password) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = authResult.user;
  
      return user;
    } catch (e) {
      print(e.toString());
    }
  }
  //logout

   Future signOut() async {
    try {
      return _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}