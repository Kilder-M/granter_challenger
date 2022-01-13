import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:granter_challenger/app/data/models/product_model.dart';
import 'package:granter_challenger/app/modules/home/controllers/home_controller.dart';
import 'package:granter_challenger/app/modules/home/views/home_view.dart';
import 'package:granter_challenger/app/modules/home/widgets/text_form_product.dart';
import 'package:granter_challenger/app/modules/home/widgets/title_text_style.dart';

class UpdateView extends GetView<HomeController> {
  const UpdateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product product = Get.arguments;
    var form = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 50, 8, 0),
            child: Form(
              key: form,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 150, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.chevron_left,
                              size: 28,
                            ),
                          ),
                          Text(
                            'EDITAR',
                            style: titleTextStyle(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          TextFormProduct(
                            title: 'Nome',
                            initialValue: product.title,
                            onSaved: (value) {
                              product.title = value;
                            },
                          ),
                          TextFormProduct(
                            title: 'Tipo',
                            initialValue: product.type,
                            onSaved: (value) {
                              product.type = value;
                            },
                          ),
                          TextFormProduct(
                            title: 'Preço',
                            initialValue: product.price,
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              product.price = value;
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {
                              form.currentState!.save();
                              controller.save(product);
                              Get.to( const HomeView());
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: const Text(
                                    'Produto atualizado! ',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                              
                            },
                            child: const Text('Salvar'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
