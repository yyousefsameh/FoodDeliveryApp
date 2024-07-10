import 'package:flutter/material.dart';

class CustomDrawerTile extends StatelessWidget {
  const CustomDrawerTile({
    super.key,
    required this.tileName,
    required this.tileIcon,
    this.onTap,
  });

  final String tileName;
  final IconData tileIcon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        tileIcon,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      title: Text(
        tileName,
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      onTap: onTap,
    );
  }
}
