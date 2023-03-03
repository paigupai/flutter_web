import 'package:flutter/material.dart';

import '../component/animated_wave_background.dart';
import '../component/time_card.dart';
import '../screens/home/Laboratory.dart';

class SiteLayout extends StatelessWidget {
  const SiteLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Demo'),
        ),
        body: AnimatedWaveBackground(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Row(
              children: <Widget>[
                NavigationRail(
                  selectedIndex: 0,
                  backgroundColor: Colors.grey.shade200.withOpacity(0.5),
                  onDestinationSelected: (int index) {
                    // setState(() {
                    //   _selectedIndex = index;
                    // });
                  },
                  labelType: NavigationRailLabelType.selected,
                  elevation: 2,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: Text('home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.bookmark_border),
                      selectedIcon: Icon(Icons.book),
                      label: Text('Second'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.star_border),
                      selectedIcon: Icon(Icons.star),
                      label: Text('Third'),
                    ),
                  ],
                  trailing: const TimeCard(),
                ),
                const Expanded(
                  child: Laboratory(),
                )
              ],
            ),
          ),
        ));
  }
}
