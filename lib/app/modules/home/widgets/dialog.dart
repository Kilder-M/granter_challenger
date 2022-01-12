import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:granter_challenger/app/data/models/product_model.dart';
import 'package:granter_challenger/app/modules/home/controllers/home_controller.dart';

AlertDialog alertDialogProduct(
      BuildContext context, HomeController _controller, Product product) {
    return AlertDialog(
      title: const Text(
        'O que deseja fazer ?',
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text('Editar'),
        ),
        TextButton(
          onPressed: () {
            Get.back();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text(
                  'Você Tem certeza ?',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      _controller.remove(product.id);
                      Get.back();
                    },
                    child: const Text('Sim'),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Não'),
                  ),
                ],
              ),
            );
          },
          child: const Text('Excluir'),
        ),
      ],
    );
  }