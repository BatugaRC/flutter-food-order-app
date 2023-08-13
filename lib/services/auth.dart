import 'package:food_order/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  Database db = Database();
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<String> signUpAsUser(
      String username, String email, String password, String address) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await db.createUser(username, email, auth.currentUser!.uid, address);
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "0";
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> signUpAsRestaurant(
      String username, String email, String password, String address) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await db.createRestaurant(
        username,
        email,
        address,
        auth.currentUser!.uid,
      );
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "0";
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "0";
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
