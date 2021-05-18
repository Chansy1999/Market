import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final String delivery;
  final int deliveryPrice;

  const ProductCard({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.delivery,
    required this.deliveryPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatNumber = new NumberFormat("#,###");

    return Container(
      // margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [
            Colors.primaries[Random().nextInt(Colors.primaries.length)].shade200
                .withOpacity(0.20),
            Colors.primaries[Random().nextInt(Colors.primaries.length)].shade200
                .withOpacity(0.20),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(4, 4, 8, 4),
                child: Text(
                  "${formatNumber.format(deliveryPrice)} KIP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "${formatNumber.format(price)} KIP",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 4),
                      SizedBox(height: 4),
                      Text(
                        "${delivery} mins",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 4),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    bottom: 16,
                    left: 16,
                    right: 16,
                  ),
                  child: Image.asset(
                    "assets/images/avocado.png",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
