import 'package:flutter/material.dart';
import '../../../function/fhelper_function.dart';
import '../../utilis/colors.dart';

class fFormDivider extends StatelessWidget {
  const fFormDivider({
    super.key,
    required this.dividerText,
    this.textStyle,
  });
  final String dividerText;
  final TextStyle? textStyle;



  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 0,),
        Flexible(child: Divider(color: dark ? fColors.darkerGrey: fColors.grey,thickness: 0.5, indent: 60,endIndent:5,)),
        Text(dividerText,style: Theme.of(context).textTheme.labelMedium!.apply(color: Colors.white),),
        Flexible(child: Divider(color: dark ? fColors.darkerGrey: fColors.grey,thickness: 0.5, indent: 5,endIndent:5,),
        )
      ],
    );
  }
}
