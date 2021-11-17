import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices {
  /// ********category collection****************************/
  final CollectionReference _categoryCollectionRefe =
      FirebaseFirestore.instance.collection('Categories');
  Future<List<QueryDocumentSnapshot>> getCategoryFromServer() async {
    var value = await _categoryCollectionRefe.get();
    return value.docs;
  }

  /// ********products collection****************************/
  final CollectionReference _BestSellingProductCollectionRefe =
      FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getBestSellingProductFromServer() async {
    var value = await _BestSellingProductCollectionRefe.get();
    return value.docs;
  }
}
