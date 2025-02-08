import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Image(image: AssetImage("assets/icon_profile/Profile_Logo.jpg")),
      ),
      title: Text("Godwin Chimdiike Favour",style: Theme.of(context)
          .textTheme
          .titleLarge!
          .apply(color: Colors.black),
      ),subtitle: Text("godwinchimdikefavour@gmail.com",
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: Colors.black)),
    );
  }
}
