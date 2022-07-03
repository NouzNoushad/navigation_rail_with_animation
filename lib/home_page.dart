import 'package:bike_collection_ui/side_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _bikeAnimation = Tween<Offset>(
    begin: const Offset(0.6, 0.0),
    end: Offset.zero,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ),
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  final List<IconData> icons = [
    Icons.settings,
    Icons.handyman,
    Icons.two_wheeler_outlined,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 74, 76, 63),
      body: Stack(
        children: [
          Row(
            children: const [
              BikeCollectionSideBar(),
            ],
          ),
          Positioned(
            top: 110,
            left: 25,
            child: FadeTransition(
              opacity: _animation,
              child: Text(
                "bikes \ncollections".toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          appBarWidget(),
          bikeDetailsContainer(),
          bikeImage(),
          bikeListView(),
        ],
      ),
    );
  }

  Widget bikeListView() {
    return Positioned(
      bottom: 40,
      right: 30,
      child: Container(
        height: 60,
        width: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: icons.length,
          itemBuilder: (context, index) {
            final icon = icons[index];
            return ScaleTransition(
              scale: _animation,
              child: Container(
                width: 60,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 137, 140, 119),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget bikeImage() {
    return Positioned(
      bottom: 205,
      right: 5,
      child: SlideTransition(
        position: _bikeAnimation,
        child: Container(
          height: 180,
          width: 250,
          child: Image.asset("assets/bike.png", fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget bikeDetailsContainer() {
    return Positioned(
      bottom: 120,
      right: 40,
      child: FadeTransition(
        opacity: _animation,
        child: Container(
          height: 320,
          width: 185,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 137, 140, 119),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      RotationTransition(
                        turns: _animation,
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow.shade600,
                        ),
                      ),
                      const Text(
                        "4.5",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "ART BIKE \n\$5.560",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1.2, color: Colors.white),
                    ),
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBarWidget() {
    return Positioned(
      top: 40,
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 10),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
