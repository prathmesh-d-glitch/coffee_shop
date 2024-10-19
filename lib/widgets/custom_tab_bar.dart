import 'dart:ui';
import 'package:coffee/screens/home_page.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key, required this.user});
  final String user;

  @override
  // ignore: library_private_types_in_public_api
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(); // Declare PageController

  final List<IconData> _icons = [
    Icons.home,
    Icons.person,
    Icons.wallet,
    Icons.shopping_cart,
    Icons.chat,
  ];  

  @override
  void dispose() {
    _pageController.dispose(); // Dispose of the controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
    HomePage(user: widget.user,),
    const Center(child: Text('Profile Page')),
    const Center(child: Text('Wallet Page')),
    const Center(child: Text('Cart Page')),
    const Center(child: Text('Chat Page')),
  ];
    // Use MediaQuery to get the screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // PageView for changing screens
          PageView(
            controller: _pageController, // Use the PageController here
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index; // Update the selected index when the page changes
              });
            },
            children: _pages,
          ),
          Positioned(
            // Positioning using MediaQuery for responsiveness
            top: screenHeight * 0.9, // 90% down from the top of the screen
            left: screenWidth * 0.055, // 5.5% from the left side of the screen
            child: _buildTabBar(),
          ),
        ],
      ),
    );
  }

  // Custom Tab Bar
  Widget _buildTabBar() {
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;

    return IgnorePointer(
      ignoring: false, // Set to true if you want to disable interactions on the tab bar
      child: Container(
        width: screenWidth * 0.9, // 90% of the screen width
        height: 70, // You can keep this static or make it responsive
        decoration: const BoxDecoration(
          color: Color.fromRGBO(51, 51, 51, 0.84),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_icons.length, (index) {
                bool isSelected = _selectedIndex == index;
                return GestureDetector(
                  onTap: () => _onTabSelected(index),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Circular container for the icon
                      Container(
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color.fromRGBO(45, 45, 45, 1)
                              : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected
                                ? const Color.fromRGBO(94, 94, 94, 1)
                                : Colors.transparent,
                            width: 1,
                          ),
                        ),
                        padding: const EdgeInsets.all(8), // Padding for better spacing
                        child: Icon(
                          _icons[index],
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Move to the corresponding page in the PageView
    _pageController.jumpToPage(index); // Use the existing PageController
  }
}
