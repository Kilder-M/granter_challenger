import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:granter_challenger/app/data/models/product_model.dart';

class ProductDAO {
  late CollectionReference productCollection;

  ProductDAO() {
    productCollection = FirebaseFirestore.instance.collection('product');
  }

  Future<List<Product>> find() async {
    var result = await productCollection.get();
    return result.docs
        .map((doc) => Product(
              id: doc.reference.id.toString(),
              filename: doc['filename'],
              title: doc['title'],
              description: doc['description'],
              height: doc['height'],
              price: doc['price'],
              type: doc['type'],
              rating: doc['rating'],
              width: doc['width'],
            ))
        .toList();
  }

  remove(id) {
    productCollection.doc(id).delete();
  }

  save(Product product) {
    productCollection.doc(product.id).set({'id'});
  }
}
