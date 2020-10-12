import 'package:furniture_app/models/Product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<Product> myProducts;

Future<List<Product>> fetchProducts() async {
  List list = [];
  await FirebaseFirestore.instance
      .collection('furniture')
      .get()
      .then((QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach((doc) {
              list.add(doc.data());
            })
          });

  List<Product> products = list.map((data) => Product.fromJson(data)).toList();
  myProducts = products;
  return products;
}
