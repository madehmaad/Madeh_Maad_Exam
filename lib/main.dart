import 'package:flutter/material.dart';
import 'package:madeh_exam/interfaces.dart';

void main() {
  runApp(const MyApp());
}

int selectedIndex = 0;

class MyApp extends StatefulWidget  {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: pages[selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              elevation: 1,
              showSelectedLabels: true,
              selectedItemColor: Color.fromRGBO(230, 7, 7, 1),
              unselectedFontSize: 13,
              selectedFontSize: 15,
              unselectedItemColor: Colors.black,
              showUnselectedLabels: true,
              selectedLabelStyle: TextStyle(
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
              unselectedLabelStyle: TextStyle(
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
              // labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              onTap: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              currentIndex: selectedIndex,
              items: [
                BottomNavigationBarItem(
                  tooltip: '',
                  activeIcon: Icon(
                    Icons.search,
                    color: Colors.red,
                    size: 30,
                  ),
                  icon: Icon(
                    Icons.search,
                  ),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                    tooltip: '',
                    activeIcon: Icon(
                      Icons.point_of_sale_outlined,
                      color: Colors.red,
                      size: 30,
                    ),
                    icon: Icon(
                      Icons.point_of_sale,
                    ),
                    label: 'Wishlists'),
                BottomNavigationBarItem(
                    tooltip: '',
                    activeIcon: Icon(
                      Icons.help_center,
                      color: Colors.red,
                      size: 30,
                    ),
                    icon: Icon(Icons.help_center),
                    label: 'Trips'),
                BottomNavigationBarItem(
                  tooltip: '',
                  activeIcon: Icon(
                    Icons.book,
                    color: Colors.red,
                    size: 30,
                  ),
                  icon: Icon(Icons.book),
                  label: 'Inbox',
                ),
                BottomNavigationBarItem(
                  tooltip: '',
                  activeIcon: Icon(
                    Icons.more_horiz,
                    color: Colors.red,
                    size: 30,
                  ),
                  icon: Icon(Icons.more_horiz),
                  label: 'Profile',
                )
              ],
            )));
  }
}

List<Widget> pages = [
  searchPage(),
  Scaffold(),
  Scaffold(),
  Scaffold(),
  Scaffold(),
];
