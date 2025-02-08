import 'package:estateapp1/common/widgets/headings_MenuTiles/fsection_heading.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../card/wdigets/fdetail_image.dart';

class frecentPostedDetailscreen extends StatelessWidget {
  const frecentPostedDetailscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: [
            DetailImage(),

        SizedBox(height: 8,),
        fSectionHeading(title: "Discription",showActionButton: false,textColor: Colors.blue,),

        Padding(
          padding: EdgeInsets.only(left: 15),
          child: ReadMoreText(
            "Welcome to a refined living experience in this elegant estate apartment, designed for comfort, convenience, and style. Nestled in a serene and secure environment, this residence offers spacious interiors, premium finishes, and breathtaking views that redefine urban luxury",
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
                     child: Icon(Icons.phone, color: Colors.blue),
                   ),
                 ],
               ),
              )


              ) ],
    ),
    ),
    );
  }
}
