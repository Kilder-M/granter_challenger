import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:granter_challenger/app/data/models/product_model.dart';
import 'package:granter_challenger/app/modules/home/views/product_details_view.dart';
import 'package:granter_challenger/app/modules/home/widgets/dialog.dart';
import 'package:granter_challenger/app/modules/home/widgets/title_text_style.dart';
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
        padding: const EdgeInsets.fromLTRB(8, 80, 8, 0),
        child: Obx(()=>
           Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 7.0),
                child: Text(
                  'PRODUTOS',
                  style: titleTextStyle(),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<Product>>(
                    future: _controller.list.value,
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
                              var product = list[i];
                              return GestureDetector(
                                onTap: (){
                                  Get.to(const ProductDetailsView(),arguments: product);
                                },
                                child: CardForListProducts(
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
                                          return alertDialogProduct(
                                              context, _controller, product);
                                        });
                                  },
                                ),
                              );
                            });
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}
