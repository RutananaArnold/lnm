import 'package:lnm/widgets/bottom_bar.dart';
import 'package:lnm/widgets/carousel.dart';
import 'package:lnm/widgets/destination_heading.dart';
import 'package:lnm/widgets/featured_heading.dart';
import 'package:lnm/widgets/featured_tiles.dart';
import 'package:lnm/widgets/floating_quick_access_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late ScrollController _scrollController;
  // double _scrollPosition = 0;
  // double _opacity = 0;

  // _scrollListener() {
  //   setState(() {
  //     _scrollPosition = _scrollController.position.pixels;
  //   });
  // }

  // @override
  // void initState() {
  //   _scrollController = ScrollController();
  //   _scrollController.addListener(_scrollListener);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    // _opacity = _scrollPosition < screenSize.height * 0.40
    //     ? _scrollPosition / (screenSize.height * 0.40)
    //     : 1;

    return Scaffold(
      body: SingleChildScrollView(
        // controller: _scrollController,
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: SizedBox(
                    height: screenSize.height * 0.45,
                    width: screenSize.width,
                    child: Image.asset(
                      'assets/images/top_pic.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    FloatingQuickAccessBar(screenSize: screenSize),
                    Container(
                      child: Column(
                        children: [
                          FeaturedHeading(
                            screenSize: screenSize,
                          ),
                          FeaturedTiles(screenSize: screenSize)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            DestinationHeading(screenSize: screenSize),
            DestinationCarousel(),
            SizedBox(height: screenSize.height / 10),
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}
