import 'package:flutter/material.dart';

import '../../common/utilis/sizes.dart';
import 'fshimmer_effect.dart';

class fVerticalProductshimmer extends StatelessWidget {
  const fVerticalProductshimmer({
    super.key,
    this.itemCount = 2,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return fGridlayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => SizedBox(
              width: 180,height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Image
                  fShimmerEffect(
                    width: 180,
                    height: 140,
                  ),
                  SizedBox(
                    height: fSizes.spaceBtwItems,
                  ),

                  /// Text
                  fShimmerEffect(width: 160, height: 15),
                  SizedBox(
                    height: fSizes.spaceBtwItems / 2,
                  ),
                  fShimmerEffect(width: 110, height: 15),
                ],
              ),
            ));
  }
}


class fVerticalProductshimmers extends StatelessWidget {
  const fVerticalProductshimmers({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return fGridlayouts(
        itemCount: itemCount,
        itemBuilder: (_, __) => SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              fShimmerEffect(
                width: 180,
                height: 180,
              ),
              SizedBox(
                height: fSizes.spaceBtwItems,
              ),

              /// Text
              fShimmerEffect(width: 160, height: 15),
              SizedBox(
                height: fSizes.spaceBtwItems / 2,
              ),
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
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 200,
        crossAxisSpacing: 3.0,
        crossAxisCount: 2, mainAxisSpacing: 10,
      ),
      itemBuilder: itemBuilder,
    );
  }
}

class fGridlayouts extends StatelessWidget {
  const fGridlayouts({
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
    return ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        scrollDirection: Axis.vertical,
        itemBuilder: itemBuilder,
        itemCount: itemCount,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(
          left: 16.0, // Left space
          right: 16.0, // Right space
          bottom: 16.0, // Bottom space
        ));
  }
}


class fCategoryShimmer extends StatelessWidget {
  const fCategoryShimmer({
    super.key,
    this.itemCount = 3,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 110,
        width: 320,
        child: ListView.separated(
            itemCount: itemCount,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            separatorBuilder: (_, __) =>  SizedBox(
              height: fSizes.spaceBtwItems,
            ),
            itemBuilder: (_, __) {
              return  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Image
                  fShimmerEffect(
                      width: 400,
                      height: 200
                    //    radius: 55,
                  ),
                  SizedBox(
                    height: fSizes.spaceBtwItems / 2,
                  ),


                  /// Text

                  /// Text
                  // fShimmerEffect(width: 55, height: 8),
                ],
              );
            }));
  }
}
