import 'package:flutter/material.dart';

class CardForListProducts extends StatelessWidget {
  final String? photoUrl;
  final String? title;
  final String? subTitle;
  final double? heigth;
  final double? width;
  final double? photoHeight;
  final double? photoWidth;
  final double? borderRadius;
  final String? price;
  final String? ratingNumber;
  final Color? backgroundColor;
  final void Function()? onTapIcon;

  const CardForListProducts(
      {Key? key,
      this.heigth,
      this.width,
      this.borderRadius,
      this.backgroundColor,
      this.photoHeight,
      this.photoWidth,
      this.photoUrl,
      this.title,
      this.subTitle,
      this.onTapIcon,
      this.ratingNumber,
      this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
        width: width ?? double.infinity,
        height: heigth,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              spreadRadius: 0.1,
              color: Colors.grey,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  color: (photoUrl == null) ? Colors.lightBlue : null,
                  width: photoWidth,
                  height: photoHeight,
                  child: (photoUrl == null)
                      ? const Center(child: Text('Photo'))
                      : Image.network(photoUrl ?? ''),
                ),
              ),
              Column(
               // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 170,
                    child: Text(
                      title ?? '',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[800],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3.0,0,0,5),
                    child: Text(
                      subTitle ?? '',
                      style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(ratingNumber ?? ''),
                      const Icon(
                        Icons.star_border,
                        color: Colors.lightBlue,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              GestureDetector(
                onTap: onTapIcon,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       const Icon(
                        Icons.more_horiz_sharp,
                        size: 18,
                      ),
                      Text('R\$ $price',style: const TextStyle(fontSize: 16),textDirection: TextDirection.rtl,)
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle textStyle() {
  return TextStyle(fontSize: 2);
}
