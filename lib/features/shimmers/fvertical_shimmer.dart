import 'package:flutter/material.dart';

import '../../common/utilis/sizes.dart';
import 'fshimmer_effect.dart';

class fVerticalProductshimmer extends StatelessWidget {
  const fVerticalProductshimmer({super.key,
    this.itemCount = 2,

  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return fGridlayout(itemCount: itemCount, itemBuilder: (_, __) => SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image
          fShimmerEffect(width: 180, height: 180,),
          SizedBox(height: fSizes.spaceBtwItems,),

          /// Text
          fShimmerEffect(width: 160, height: 15),
          SizedBox(height: fSizes.spaceBtwItems /2,),
          fShimmerEffect(width: 110, height: 15),
        ],
      ),
    ));
  }
}

class fGridlayout extends StatelessWidget {
  const fGridlayout({
    super.key,
    required this.itemCount,
    this.mainAxisCount = 294,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding:  EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent : mainAxisCount,
        mainAxisSpacing: fSizes.gridViewSpacing,
        crossAxisSpacing: fSizes.gridViewSpacing,
      ),
      itemBuilder: itemBuilder,
    );
  }
}