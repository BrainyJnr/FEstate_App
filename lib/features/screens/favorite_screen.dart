import 'package:estateapp1/features/card/wdigets/ffavorite_listview_seperated.dart';
import 'package:estateapp1/features/favorite_designs/favorite_design_screen.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white,
          title: Text("Favorite"),
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 22, top: 12, right: 16),
            child: SingleChildScrollView(
                child: favorite_list_view_seperated(
              itemBuilder: (_, index) => FavoriteDesignScreen(),
              itemCount: 4,
            ))));
  }
}
