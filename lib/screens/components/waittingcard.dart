import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WaittingCard extends StatelessWidget {
  const WaittingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade200.withOpacity(0.40),
        highlightColor: Colors.grey.shade300.withOpacity(0.40),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.primaries[Random().nextInt(Colors.primaries.length)]
                    .shade200,
                Colors.primaries[Random().nextInt(Colors.primaries.length)]
                    .shade200,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
