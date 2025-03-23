import 'package:estateapp1/common/authentication/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../common/image_widgets/fcircular_image.dart';
import '../../common/utilis/images.dart';
import '../shimmers/fshimmer_effect.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Column(
        children: [
         Obx(() {
          final networkImage = controller.user.value.profilePicture;
          final image = networkImage.isNotEmpty ? networkImage : fImages.PopularEstates8;
          return controller.imageUploading.value
              ? const fShimmerEffect(width: 80, height: 80, radius: 80)
              : fCircular_Images(
              fit: BoxFit.cover,backgroundColor: Colors.brown,
              image: image, width: 60,height: 55, isNetworkImage: networkImage.isNotEmpty);
        }),
    ]  ),
      title: GestureDetector(
        onTap: () => controller.uploadUserProfilePicture(),
        child: Text("Godwin Chimdike Favour",style: Theme.of(context)
            .textTheme
            .titleLarge!
            .apply(color: Colors.black),
        ),
      ),subtitle: Text("godwinchimdikefavour@gmail.com",
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: Colors.black)),
    );
  }
}
