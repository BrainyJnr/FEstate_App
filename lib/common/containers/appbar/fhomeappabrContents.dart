import 'package:flutter/material.dart';

class fhomeappabrContents extends StatelessWidget {
  const fhomeappabrContents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(left: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text("Hello",
                  style: TextStyle(color: Colors.white),
                )]),
          ),
          Padding(padding: EdgeInsets.only(left: 15),
            child:   Text(
                "Hallo Tunzabaia",
                style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white)
            ),
          ) ]);
  }
}
