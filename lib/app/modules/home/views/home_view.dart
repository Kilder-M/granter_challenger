import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:granter_challenger/app/data/models/product_model.dart';
import 'package:granter_challenger/app/util/widgets/card_for_list_products.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 50, 8, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                'PRODUTOS',
                style: titleTextStyle(),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Product>>(
                  future: _controller.list,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      var list = snapshot.data;
                      return ListView.builder(
                          itemCount: list!.length,
                          itemBuilder: (context, i) {
                            Product product = list[i];
                            return CardForListProducts(
                              width: double.infinity,
                              heigth: 70,
                              title: product.title,
                              subTitle: product.type,
                              photoHeight: 55,
                              photoWidth: 55,
                              ratingNumber: product.rating,
                              price: product.price,
                              onTapIcon: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          'O que deseja fazer ?',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        actions: [
                                          TextButton(onPressed: (){}, child: Text('Editar'),),
                                          TextButton(onPressed: (){
                                            
                                          }, child: Text('Excluir'),),
                                        ],
                                      );
                                    });
                              },
                            );
                          });
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle titleTextStyle() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    );
  }
}
