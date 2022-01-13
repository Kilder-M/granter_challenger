import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:granter_challenger/app/data/models/product_model.dart';

class ProductDAO {
  late CollectionReference productCollection;

  ProductDAO() {
    productCollection = FirebaseFirestore.instance.collection('product');
  }

  Future<List<Product>> find() async {
    var result = await productCollection.get();
    return result.docs.map((doc) => Product.fromDoc(doc)).toList();
  }

  remove(id) {
    productCollection.doc(id).delete();
  }

  save(Product product) {
    productCollection.doc(product.id).set(
        {'title': product.title, 'type': product.type, 'price': product.price},
        SetOptions(merge: true));
  }
}
