import 'package:flutter/material.dart';

class BikeCollectionSideBar extends StatefulWidget {
  const BikeCollectionSideBar({Key? key}) : super(key: key);

  @override
  State<BikeCollectionSideBar> createState() => _BikeCollectionSideBarState();
}

class _BikeCollectionSideBarState extends State<BikeCollectionSideBar> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: NavigationRail(
        backgroundColor: const Color.fromARGB(255, 137, 140, 119),
        selectedIndex: _selectedIndex,
        labelType: NavigationRailLabelType.all,
        selectedLabelTextStyle: const TextStyle(
          color: Colors.white,
        ),
        unselectedLabelTextStyle: const TextStyle(
          color: Colors.white60,
        ),
        groupAlignment: 0.4,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationRailDestination(
            icon: Icon(null),
            label: RotatedBox(
              quarterTurns: 3,
              child: Text(
                "Best sale",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ),
          NavigationRailDestination(
            icon: Icon(null),
            label: RotatedBox(
              quarterTurns: 3,
              child: Text(
                "Popular",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ),
          NavigationRailDestination(
            icon: Icon(null),
            label: RotatedBox(
              quarterTurns: 3,
              child: Text(
                "New Arrival",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
