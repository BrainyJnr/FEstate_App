import 'package:estateapp1/common/containers/appbar/fAppBar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../common/utilis/colors.dart';
import '../../common/utilis/sizes.dart';
import '../../data/fValidator.dart';
import 'edit_profile_tile.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: fAppBar(
          showBackArrow: true,
          title: Text(
            "My Profile",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
              padding: EdgeInsets.only(
                  top: 0,
                  left: fSizes.defaultSpace,
                  right: fSizes.defaultSpace,
                  bottom: fSizes.defaultSpace),
              child: Form(
                  //key: controller.updateUserNameFormKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    const Text("Full Name"),
                    TextFormField(
                      // controller: controller.fullName,
                      validator: (value) =>
                          fValidator.validateEmptyText("Full Name", value),
                      cursorColor: Colors.blue,
                      expands: false,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          hintText: "Enter your full Name",
                          hintStyle: Theme.of(context).textTheme.bodySmall,
                          prefixIcon: const Icon(
                            Iconsax.user,
                            color: Colors.blue,
                          )),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(33),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: Colors.blue,
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Edit Profile",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    )
                  ])))
        ])));
  }
}
