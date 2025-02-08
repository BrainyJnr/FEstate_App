import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../data/device_utility.dart';
import '../../function/fhelper_function.dart';
import '../utilis/colors.dart';
import '../utilis/sizes.dart';



class fSearch_Container extends StatelessWidget {
  fSearch_Container({
    super.key, required this.text,
    this.icon = Iconsax.search_normal,
    this.icons = Icons.dashboard,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,this.padding = const EdgeInsets.symmetric(horizontal: fSizes.defaultSpace),

  });

  final String text;
  final IconData? icon;
  final IconData? icons;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final TextEditingController searchController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    TextEditingController searchController = TextEditingController();

    //String searchText = "";
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: fDeviceUtilis.getScreenWidth(context),
          padding: const EdgeInsets.all(fSizes.md),

          decoration: BoxDecoration(
              color: showBackground ? dark ? fColors.dark : fColors.light : Colors.transparent,
              borderRadius: BorderRadius.circular(40),
              border: showBorder ? Border.all(color: fColors.grey) : null

          ),
          child: Row(
            children: [
              Icon(icon,color: fColors.darkerGrey,),
              const SizedBox(width: fSizes.spaceBtwItems,),
              Text(text, style: Theme.of(context).textTheme.bodySmall,),
              SizedBox(width: 55,),
              Icon(icons,color: fColors.darkerGrey,),


            ],
          ),
        ),
      ),
    );
  }
}
