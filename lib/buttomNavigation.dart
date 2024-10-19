import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:movies_ui/page_of_buttomnavegition/actvity.dart';
import 'package:movies_ui/page_of_buttomnavegition/home_page.dart';
import 'package:movies_ui/page_of_buttomnavegition/profile.dart';
import 'package:movies_ui/page_of_buttomnavegition/search.dart';


class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});


  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  var currentIndex = 0;

  var screens = [
    const HomePage(),
    const SearchPage(),
    const Actvity(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.red,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.search, title: 'Search'),
          TabItem(icon: Icons.add, title: 'Activity'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        elevation: 10,
        activeColor: Colors.white,
        shadowColor: Colors.red,

        initialActiveIndex: currentIndex,

      ),
      body: screens[currentIndex],
    );
  }
}
