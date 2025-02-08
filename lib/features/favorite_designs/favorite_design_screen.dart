import 'package:flutter/material.dart';

import '../../common/containers/frounded_container.dart';
import '../../common/utilis/colors.dart';
import '../../common/utilis/sizes.dart';
import '../../function/fhelper_function.dart';
import '../card/wdigets/festate_favorite_icon.dart';
import '../card/wdigets/festate_houses.dart';
import '../card/wdigets/festate_price.dart';
import '../card/wdigets/festate_titletext.dart';

class FavoriteDesignScreen extends StatelessWidget {
  const FavoriteDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return SizedBox(
      width: 100,
      height: 90,
      child: Container(
        width: 320,
        height: 150,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: dark ? fColors.black : fColors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5), // Shadow color
              spreadRadius: 2, // Spread radius
              blurRadius: 5, // Blur radius
              offset: Offset(0, 3), // Offset in X and Y directions
            ),
          ],
        ),
        child: Stack(
          children: [
            // Main content of the container
            Row(
              children: [
                /// Thumbnail
                fRoundedContainer(
                  height: 130,
                  padding: EdgeInsets.all(fSizes.sm),
                  backgroundColor: dark ? fColors.black : fColors.white,
                  child: festates(
                    width: 85,
                    height: 100,
                    fit: BoxFit.cover,
                    image: "assets/images/House1.jpeg",
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 25,
                      width: 200,
                      child: Padding(
                        padding: EdgeInsets.only(top: fSizes.sm, left: fSizes.sm),
                        child: fEstateTitleText(
                          title: "Rose garden apartment",
                        ),
                      ),
                    ),
                    SizedBox(height: 3),
                    Padding(
                      padding: EdgeInsets.only(right: 74),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 8,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "London mongopak",
                            style: Theme.of(context).textTheme.labelSmall!.apply(
                                color: dark ? Colors.white : Colors.black.withOpacity(0.5)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2),
                    Padding(
                      padding: EdgeInsets.only(right: 150),
                      child: estateprices(
                        price: "100",
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Favorite icon at the bottom right of the main container
            Positioned(
              right: 10, // Distance from the right
              top: 10, // Distance from the bottom
              child: fcircular_favorite_icon(), // Your favorite icon widget
            ),
          ],
        ),
      ),
    );
  }
}
