import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salem/model/user_model.dart';

class FireStoreUser {
  final CollectionReference _userCollectionReference =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollectionReference
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<DocumentSnapshot> getCurrentUser(String uid)async
  {
    return await _userCollectionReference.doc(uid).get();
  }
}
