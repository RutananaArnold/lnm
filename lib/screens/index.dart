import 'package:flutter/material.dart';
import 'package:lnm/screens/appointment.dart';
import 'package:lnm/screens/get_in_touch.dart';
import 'package:lnm/screens/home_page.dart';
import 'package:lnm/widgets/explore_drawer.dart';
import 'package:lnm/widgets/responsive.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:lnm/widgets/web_scrollbar.dart';

class Index extends StatefulWidget {
  Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    //for the tabs
    _tabController = TabController(length: 3, vsync: this);

    //for the scrolling effect
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor:
                  Theme.of(context).bottomAppBarColor.withOpacity(0.5),
              elevation: 0,
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.brightness_6),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    EasyDynamicTheme.of(context).changeTheme();
                  },
                ),
              ],
              title: Text(
                'LNM',
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: Container(
                color: Theme.of(context).bottomAppBarColor.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'LNM',
                        style: TextStyle(
                          color: Colors.blueGrey[100],
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 3,
                        ),
                      ),
                      SizedBox(width: screenSize.width / 8),
                      Expanded(
                        child: TabBar(
                          controller: _tabController,
                          tabs: const [
                            Tab(text: 'Home'),
                            Tab(text: 'Appointment'),
                            Tab(text: 'Get In Touch'),
                          ],
                        ),
                      ),
                      SizedBox(width: screenSize.width / 20),
                      IconButton(
                        icon: const Icon(Icons.brightness_6),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        color: Colors.white,
                        onPressed: () {
                          EasyDynamicTheme.of(context).changeTheme();
                        },
                      ),
                      SizedBox(
                        width: screenSize.width / 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
      drawer: const ExploreDrawer(),
      body: WebScrollbar(
        color: Colors.blueGrey,
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        width: 10,
        heightFraction: 0.3,
        controller: _scrollController,
        child: TabBarView(
          controller: _tabController,
          children: [
            HomePage(),
            Appointment(),
            GetInfor(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
