import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:granter_challenger/app/modules/home/widgets/product_details_card.dart';
import 'package:granter_challenger/app/modules/home/widgets/title_text_style.dart';

class ProductDetailsView extends GetView {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 50, 8, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 135, 0),
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
                            'DETALHES',
                            style: titleTextStyle(),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding:  EdgeInsets.all(35.0),
                      child: ProductDetailsCard(width: double.infinity,photoWidth: 100,photoHeight: 100,),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
