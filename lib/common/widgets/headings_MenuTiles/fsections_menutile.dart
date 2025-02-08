import 'package:flutter/material.dart';


class fSettingsMenuTile extends StatelessWidget {
  const fSettingsMenuTile({super.key, required this.title, this.onTap, this.trailing, required this.icon});

  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,size: 28,color: Colors.blue,),
      title: Text(title,style: Theme.of(context).textTheme.labelLarge,),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
