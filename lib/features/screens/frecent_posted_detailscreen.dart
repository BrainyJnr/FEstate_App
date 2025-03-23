import 'package:estateapp1/common/widgets/headings_MenuTiles/fsection_heading.dart';
import 'package:estateapp1/features/card/controller/recent_controller.dart';
import 'package:estateapp1/features/image_controllers/recent_image_controller.dart';
import 'package:estateapp1/features/model/recent_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../function/number.dart';
import '../card/wdigets/fdetail_image.dart';

class frecentPostedDetailscreen extends StatelessWidget {
  const frecentPostedDetailscreen({super.key, required this.recent});

  final RecentModel recent;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RecentImageController());
    final controlle = Get.put(RecentController());
    final images = controller.getRecentImages(recent);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          DetailImage(
            recent: recent,
          ),
          SizedBox(
            height: 8,
          ),
          fSectionHeading(
            title: "Discription",
            showActionButton: false,
            textColor: Colors.blue,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: ReadMoreText(
              recent.description ?? "",
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimCollapsedText: "Show more",
              trimExpandedText: "Show less",
              moreStyle: const TextStyle(
                fontSize: 12,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
              lessStyle: const TextStyle(
                fontSize: 12,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          fSectionHeading(
            title: "Listing agent",
            showActionButton: false,
            textColor: Colors.blue,
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // Aligns items to the start
                  children: [
                    ClipOval(
                      child: Image.network(
                        recent.userImage ?? "", // Fetch image URL
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          print(
                              "Invalid Image URL: ${recent.userImage}"); // Debugging step
                          return Icon(Icons.person,
                              size: 60,
                              color: Colors.grey); // Show placeholder icon
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    // Adds slight spacing between image and text
                    Text(
                      recent.ownerName ?? "",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    // Pushes phone icon to the right
                    Container(
                        height: 37,
                        width: 37,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                   child:    IconButton(
                     onPressed: () {
                       makePhoneCall(recent.phoneNumber ?? "");
                     },
                     icon: Icon(Icons.phone, color: Colors.blue),
                   )

                    )],
                ),
              ))
        ],
      ),
    ));
  }
}
