import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:granter_challenger/app/data/models/product_model.dart';
import 'package:granter_challenger/app/modules/home/views/update_view_view.dart';

class ProductDetailsCard extends StatelessWidget {
  final Color? backgroundColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final double? photoWidth;
  final double? photoHeight;
  final String? photoUrl;
  final String? productName;
  final String? productType;
  final String? productHeight;
  final String? productWidth;
  final String? productPrice;
  final String? productRating;
  final void Function()? onTapIcon;

  const ProductDetailsCard(
      {Key? key,
      this.height,
      this.width,
      this.productName,
      this.productType,
      this.productHeight,
      this.productWidth,
      this.productPrice,
      this.productRating,
      this.backgroundColor,
      this.borderRadius, this.photoUrl, this.photoWidth, this.photoHeight, this.onTapIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product product = Get.arguments;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(borderRadius ?? 15),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 0.5,
              spreadRadius: 0.1,
            ),
          ],),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: (photoUrl == null) ? Colors.lightBlue : null,
                    width: photoWidth,
                    height: photoHeight,
                    child: (photoUrl == null)
                        ? const Center(child: Text('Photo'))
                        : Image.network(photoUrl ?? ''),
                  ),
                ),
                leftText('Nome',product.title ?? ''),
                leftText('Tipo',product.type ?? ''),
                leftText('valor',product.price ?? ''),
                leftText('Largura',product.width ?? ''),
                leftText('Altura',product.height ?? ''),
                leftText('Avaliação',product.rating ?? ''),
                leftText('Decrição',product.description ?? '',isDescription: true),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: ElevatedButton(onPressed: (){
                    Get.to(const UpdateView(),arguments: product);
                  }, child: const Text('Editar'),),
                ),
               
              ],
            ),
          ),
    );
  }
}

Widget leftText(String definition,String details,{bool? isDescription}){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical:4.0),
    child: Row(
      crossAxisAlignment: isDescription == true ? CrossAxisAlignment.start:CrossAxisAlignment.center,
      children: [
       Text('$definition: ',maxLines: 4,style: TextStyle(fontSize: 14,color: Colors.grey[800]),),
      SizedBox(width: 150,child: Text(details,maxLines:4,style: TextStyle(fontSize: 12,color: Colors.grey[600]))),

    ],),
  );
}
