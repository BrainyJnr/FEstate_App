import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../common/containers/appbar/fAppBar.dart';
import '../../common/utilis/sizes.dart';
import '../../common/utilis/texts.dart';
import '../../data/fValidator.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: fAppBar(
        showBackArrow: true, title: Text("Change Name", style: Theme
          .of(context)
          .textTheme
          .titleLarge,),),

      body: Padding(
          padding: EdgeInsets.all(fSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            /// Headings
            Text("Use name for any verification. This name will appear on several pages",
            style: Theme
                .of(context)
                .textTheme
                .labelMedium,
          ),
          const SizedBox(height: fSizes.spaceBtwSections,),

          /// Text field and Button
          Form(
            // key: controller.updateUserNameFormKey,
            child: Column(
              children: [
            TextFormField(
            decoration: InputDecoration(focusColor: Colors.black,
              labelStyle: TextStyle(color: Colors.black),
              hintStyle: TextStyle(color: Colors.black),
            labelText: fTexts.firstName, prefixIcon: Icon(Iconsax.user),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue)),),
            // controller: controller.firstName,
            validator: (value) =>
                fValidator.validateEmptyText("First Name", value),
            expands: false,
          ),
          SizedBox(height: fSizes.spaceBtwInputFields,),
          TextFormField(style: TextStyle(color: Colors.black),
            decoration: InputDecoration(labelStyle: TextStyle(color: Colors.black),hintStyle: TextStyle(color: Colors.black),
                labelText: fTexts.lastName,focusColor: Colors.black,
                prefixIcon: Icon(Iconsax.user),


              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue))),
              //   controller: controller.lastName,
              validator: (value) =>
                  fValidator.validateEmptyText("Last Name", value),
              expands: false,

            )],
          )),
      const SizedBox(height: fSizes.spaceBtwSections,),

      /// Save Button
      SizedBox(width: double.infinity,height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
              side: BorderSide(color: Colors.blue),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          ),
          onPressed: () {}, child: Text("Save",style: TextStyle(color: Colors.white),),),
      )
      ],
    ),)
    ,
    );
  }
}