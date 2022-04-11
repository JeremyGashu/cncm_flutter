import 'package:cncm_flutter_new/presentation/blocs/newsfeed/newsfeed_bloc.dart';
import 'package:cncm_flutter_new/presentation/blocs/newsfeed/newsfeed_events.dart';
import 'package:cncm_flutter_new/presentation/pages/homepage/tab_blogs.dart';
import 'package:cncm_flutter_new/presentation/pages/homepage/tab_home.dart';
import 'package:cncm_flutter_new/presentation/pages/homepage/tab_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String homePageRouteName = 'home page route name';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    const TabHomePage(),
    const TabHomePage(),
    const TabsBlog(),
    const TabProfilePage(),
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<NewsFeedBloc>(context).add(LoadNewsFeed());
        // return ;
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.white,
          onTap: (index) {
            debugPrint('$index');
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              label: '',
              icon: Icon(
                Icons.grid_4x4,
                // color: Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              label: '',
              icon: Icon(
                Icons.money,
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              label: '',
              icon: Icon(Icons.edit),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              label: '',
              icon: Icon(
                Icons.person,
              ),
            ),
          ],
        ),
        body: _pages[_selectedIndex],
      ),
    );
  }
}
