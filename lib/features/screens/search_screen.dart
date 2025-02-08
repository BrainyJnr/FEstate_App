import 'package:estateapp1/common/utilis/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title: Text("Let's find you the best"),

      ),

      body: Padding(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Iconsax.search_normal,
              color: Colors.blue,
            ),
            suffixIcon: Icon(
              Icons.arrow_forward_rounded,
              color: Colors.blue,
            ),
            hintText: "Start searching...",
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(6.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.1),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(6.0),
            ),
            contentPadding: EdgeInsets.fromLTRB(40.0, 15.0, 20.0, 15.0),
          ),
          ),
      ),


    );
  }
}
