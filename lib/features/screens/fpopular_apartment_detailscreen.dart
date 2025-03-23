import 'package:estateapp1/app.dart';
import 'package:estateapp1/common/widgets/headings_MenuTiles/fsection_heading.dart';
import 'package:estateapp1/features/image_controllers/popular_image_controller.dart';
import 'package:estateapp1/features/model/popular_model.dart';
import 'package:estateapp1/features/model/recent_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import '../card/wdigets/fpopular_detail_image.dart';

class fPopularApartmentDetailScreen extends StatelessWidget {
  const fPopularApartmentDetailScreen({super.key, required this.popular});

  final PopularModel popular;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PopularImageController());
    final images = controller.getPopularImages(popular);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PopularDetailImage(popular: popular,),

            SizedBox(height: 8,),
            fSectionHeading(title: "Discription",showActionButton: false,textColor: Colors.blue,),

            Padding(
              padding: EdgeInsets.only(left: 15),
              child: ReadMoreText(
                popular.description ?? "",
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: "Show more",
                trimExpandedText: "Show less",
                moreStyle: const TextStyle(
                  fontSize: 12,color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
                lessStyle: const TextStyle(
                  fontSize: 12,color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 14,),

            fSectionHeading(title: "Listing agent",showActionButton: false,textColor: Colors.blue,),
            SizedBox(height: 5,),
            Padding(padding: EdgeInsets.only(left: 20,right: 20),
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Aligns items to the start
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/icon_profile/Profile_Logo.jpg",
                          height: 60,
                        ),
                      ),
                      SizedBox(width: 10), // Adds slight spacing between image and text
                      Text(
                        "Hallo Tunzabia",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Spacer(), // Pushes phone icon to the right
                      Container(
                        height: 37,
                        width: 37,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                       child:    IconButton(
                            onPressed: () async {
                              if (popular.phoneNumber != null && popular.phoneNumber!.isNotEmpty) {
                                final Uri phoneUri = Uri(scheme: "tel", path: popular.phoneNumber);
                                if (await canLaunchUrl(phoneUri)) {
                                  await launchUrl(phoneUri);
                                } else {
                                  print("Could not launch dialer");
                                }
                              } else {
                                print("Phone number is missing");
                              }
                            },
                            icon: Icon(Icons.phone, color: Colors.blue),
                          )                      )],
                  ),
                )


            ) ],
        ),
      ),
    );
  }
}