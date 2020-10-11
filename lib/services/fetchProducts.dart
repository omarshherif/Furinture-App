import 'package:furniture_app/models/Product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Product>> fetchProducts() async {
  List l = [];
  await FirebaseFirestore.instance
      .collection('furniture')
      .get()
      .then((QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach((doc) {
              l.add(doc.data());
            })
          });

  List<Product> products = l.map((data) => Product.fromJson(data)).toList();

  return products;
}
