import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../firebase_options.dart';

abstract class FirestoreFactory {
  Future<FirebaseFirestore> create();

  // void register(
  //   String firstName,
  //   String lastName,
  //   String gender,
  //   int age,
  //   String email,
  //   String phoneNumber,
  //   String job,
  //   String password,
  // );
}

class FirestoreFactoryImpl implements FirestoreFactory {

  @override
  Future<FirebaseFirestore> create() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseFirestore f = FirebaseFirestore.instance;
    return FirebaseFirestore.instance;
  }
}
