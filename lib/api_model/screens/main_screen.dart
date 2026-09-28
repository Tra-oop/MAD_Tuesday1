import 'package:flutter/material.dart';
import 'package:num_rean_flutter/api_model/screens/settings_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: Container(color: Colors.blue),
          item: ItemConfig(
            icon: const Icon(Icons.home),
            title: "Home",
            activeForegroundColor: Theme.of(context)
                .colorScheme
                .onPrimaryContainer,
            inactiveForegroundColor: Theme.of(context)
                .colorScheme
                .onInverseSurface,
          ),
        ),

        PersistentTabConfig(
          screen: Container(color: Colors.lime),
          item: ItemConfig(
            icon: const Icon(Icons.message),
            title: "Message",
            activeForegroundColor: Theme.of(context)
                .colorScheme
                .onPrimaryContainer,
            inactiveForegroundColor: Theme.of(context)
                .colorScheme
                .onInverseSurface,
          ),
        ),

        PersistentTabConfig(
          screen: SettingsScreen(),
          item: ItemConfig(
            icon: Icon(Icons.settings),
            title: "Settings",
            activeForegroundColor: Theme.of(context)
                .colorScheme
                .onPrimaryContainer,
            inactiveForegroundColor: Theme.of(context)
                .colorScheme
                .onInverseSurface,
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
