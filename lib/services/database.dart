import 'package:cloud_firestore/cloud_firestore.dart';


class Database {


  CollectionReference users = FirebaseFirestore.instance.collection("users");
  CollectionReference restaurants = FirebaseFirestore.instance.collection("restaurants");
  
  Future<void> createUser(String username, String email, String uid, String address, String type) async {
    await users.doc(uid).set({
      "username" : username,
      "email" : email,
      "messages": [],
      "orders": [],
      "address" : address,
      "type": type
    });
  }

  Stream<DocumentSnapshot> getUserData(String? uid) {
    return users.doc(uid).snapshots();
  }

  Future<void> createRestaurant(String name, String email, String address, String id) async {
    await restaurants.doc(id).set({
      "name": name,
      "email": email,
      "address": address,
      "foods": [],
      "description": "",
      "public": false
    });
  }

  Stream<QuerySnapshot> getRestaurants() {
    return restaurants.snapshots();
  }

  Stream<DocumentSnapshot> getRestaurantData(String id) {
    return restaurants.doc(id).snapshots();
  }

  Future<String> getType(String uid) async {
    DocumentSnapshot snapshot = await users.doc(uid).get();
    return snapshot.get("type");
  }

}