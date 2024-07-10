import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/views/settings_view.dart';
import 'package:food_delivery_app/utils/theme_provider.dart';
import 'package:food_delivery_app/widgets/custom_drawer_tile.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80.0,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          // home list tile
          CustomDrawerTile(
            tileName: "H O M E",
            tileIcon: Icons.home_rounded,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          CustomDrawerTile(
            tileName: "S E T T I N G S",
            tileIcon: Icons.settings_rounded,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsView(),
                ),
              );
            },
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: CustomDrawerTile(
                  tileName: "S I G N  O U T",
                  tileIcon: Icons.logout_outlined,
                  onTap: () {},
                ),
              ),
              const Spacer(),
              IconButton(
                icon: isDark
                    ? const Icon(
                        Icons.light_mode_outlined,
                      )
                    : Icon(
                        Icons.dark_mode_outlined,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                },
              ),
            ],
          ),
          const SizedBox(
            height: 25.0,
          ),
        ],
      ),
    );
  }
}
