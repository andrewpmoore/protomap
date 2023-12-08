import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gusty/src/common/common.dart';
import 'package:gusty/src/extensions/build_context_extensions.dart';
import 'package:gusty/src/models/weather_area.dart';
import 'package:gusty/src/ui/dashboard/dashboard.dart';
import 'package:gusty/src/ui/map/map_view.dart';
import 'package:gusty/src/ui/settings/settings_view.dart';
import 'package:gusty/src/ui/weather_area_list_view.dart';
import 'package:gusty/src/shared_providers/weather_areas_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    HapticFeedback.selectionClick();
    setState(() {
      _selectedIndex = index;
    });
  }


  static const List<Widget> _pages = <Widget>[
    WeatherAreaList(),
    MapView(),
    DashboardView(),
    SettingsView(),
  ];


  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {

        return Scaffold(
          backgroundColor: context.colorScheme.background,
          bottomNavigationBar: isHandset(context) ? NavigationBar(
            animationDuration: const Duration(seconds: 1),
            // backgroundColor: context.colorScheme.surface,
            selectedIndex: _selectedIndex,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              onDestinationSelected: _onItemTapped,
              destinations: [
                NavigationDestination(icon: Image.asset('$imagePath/grid.png',height: 24, width: 24,color: _selectedIndex==0?context.colorScheme.secondary :context.colorScheme.primary ,), label: 'Home', ),
                NavigationDestination(icon: Image.asset('$imagePath/map.png',height: 24, width: 24,color: _selectedIndex==1?context.colorScheme.secondary :context.colorScheme.primary ,), label: 'Map'),
                NavigationDestination(icon: Image.asset('$imagePath/pressure.png',height: 24, width: 24,color: _selectedIndex==2?context.colorScheme.secondary :context.colorScheme.primary ,), label: 'Dashboard'),
                NavigationDestination(icon: Image.asset('$imagePath/list.png',height: 24, width: 24,color: _selectedIndex==3?context.colorScheme.secondary :context.colorScheme.primary ,), label: 'More'),
              ],
          ) : null,
          body: isHandset(context) ? Center(
            child: _pages.elementAt(_selectedIndex),
          ) : isSmallTablet(context) ? Row(
            children: <Widget>[
              NavigationRail(
                leading: const SizedBox(height: 68,),
                useIndicator: false,
                // indicatorColor: Colors.transparent,
                selectedIndex: _selectedIndex,
                onDestinationSelected: _onItemTapped,
                labelType: NavigationRailLabelType.selected,
                destinations: <NavigationRailDestination>[
                  NavigationRailDestination(icon: Image.asset('$imagePath/grid.png',height: 24, width: 24,color: _selectedIndex==0?context.colorScheme.secondary :context.colorScheme.primary ,),label: const Text('Home'),),
                  NavigationRailDestination(icon: Image.asset('$imagePath/map.png',height: 24, width: 24,color: _selectedIndex==1?context.colorScheme.secondary :context.colorScheme.primary ,),label: const Text('Map'),),
                  NavigationRailDestination(icon: Image.asset('$imagePath/pressure.png',height: 24, width: 24,color: _selectedIndex==2?context.colorScheme.secondary :context.colorScheme.primary ,),label: const Text('Dashboard'),),
                  NavigationRailDestination(icon: Image.asset('$imagePath/list.png',height: 24, width: 24,color: _selectedIndex==3?context.colorScheme.secondary :context.colorScheme.primary ,), label: const Text('More'),),
                ],
              ),
              const VerticalDivider(thickness: 1, width: 1),
              // This is the main content.
              Expanded(
                child: Center(
                  child: _pages.elementAt(_selectedIndex),
                ),
              )
            ],
          ) : Center(
            child: Row(
              children: <Widget>[
                Container(
                  // color: context.colorScheme.surface,
                  width: 200,
                  child: ListView(
                    padding: const EdgeInsets.only(top: 80, bottom: 6.0),
                    children: [
                      GestureDetector(
                          onTap: () => _onItemTapped(0),
                          child: Row(children: [const SizedBox(width: 30,), Image.asset('$imagePath/grid.png',height: 24, width: 24,color: _selectedIndex==0?context.colorScheme.secondary :context.colorScheme.primary),const SizedBox(width: 20,),Text('Home', style: context.style.labelLarge,),],)),
                      const SizedBox(height: 20,),
                      GestureDetector(
                          onTap: () => _onItemTapped(1),
                          child: Row(children: [const SizedBox(width: 30,),Image.asset('$imagePath/map.png',height: 24, width: 24,color: _selectedIndex==1?context.colorScheme.secondary :context.colorScheme.primary),const SizedBox(width: 20,),Text('Map', style: context.style.labelLarge,),],)),
                      const SizedBox(height: 20,),
                      GestureDetector(
                          onTap: () => _onItemTapped(2),
                          child: Row(children: [const SizedBox(width: 30,),Image.asset('$imagePath/pressure.png',height: 24, width: 24,color: _selectedIndex==2?context.colorScheme.secondary :context.colorScheme.primary),const SizedBox(width: 20,),Text('Dashboard', style: context.style.labelLarge,),],)),
                      const SizedBox(height: 20,),
                      GestureDetector(
                          onTap: () => _onItemTapped(3),
                          child: Row(children: [const SizedBox(width: 30,),Image.asset('$imagePath/list.png',height: 24, width: 24,color: _selectedIndex==3?context.colorScheme.secondary :context.colorScheme.primary),const SizedBox(width: 20,),Text('More', style: context.style.labelLarge,),],)),
                    ],
                  ),
                ),

                const VerticalDivider(thickness: 1, width: 1),
                // This is the main content.
                Expanded(
                  child: Center(
                    child: _pages.elementAt(_selectedIndex),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
