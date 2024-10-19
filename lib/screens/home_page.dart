import 'dart:ui';

import 'package:coffee/screens/detail_page.dart';
import 'package:coffee/widgets/beverage_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.user});
  final String user;

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/beans.jpeg'), // Background image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent, // Semi-transparent brown at the top
                      Colors.transparent,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.brown.withOpacity(0.28),
                      Colors.brown
                          .withOpacity(0.4), // Fully transparent at the bottom
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 5.0, sigmaY: 5.0), // Adjust the blur intensity
                child: Container(
                  color: Colors.white
                      .withOpacity(0.04), // Optional: Add a color overlay
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: screenHeight * 0.77,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 10.0, sigmaY: 10.0), // Adjust blur intensity
                child: Container(
                  padding:
                      const EdgeInsets.all(20), // You can adjust padding here
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.18),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.64,
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 10.0, sigmaY: 10.0), // Adjust blur intensity
                child: Container(
                  padding:
                      const EdgeInsets.all(20), // You can adjust padding here
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.18),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              // Header with profile and search bar
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.05, // Responsive top padding
                  left: screenWidth * 0.05, // Responsive left padding
                  right: screenWidth * 0.05, // Responsive right padding
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/wave.png', // Replace with your image asset path
                          width: screenWidth * 0.06, // Responsive icon width
                          height: screenWidth * 0.06, // Responsive icon height
                        ),
                        SizedBox(
                          width: screenWidth * 0.03, // Responsive spacing
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              formattedDate, // Date
                              style: GoogleFonts.inter(
                                color: const Color.fromRGBO(182, 182, 182, 1),
                                fontWeight: FontWeight.w300,
                                fontSize: 13,
                                height: 15.73 / 13,
                                letterSpacing: 0.2,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              user.isEmpty ? 'No UserName' : user, 
                              style: GoogleFonts.inter(
                                color: const Color.fromRGBO(182, 182, 182, 1),
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                height: 21.78 / 18,
                                letterSpacing: 0.2,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage:
                          const AssetImage('assets/user.png'), // Profile image
                      radius: screenWidth * 0.05, // Responsive avatar size
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05, // Responsive vertical spacing
              ),
              // Search Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04, // Horizontal padding
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search favorite Beverages',
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: screenWidth * 0.06, // Responsive icon size
                        ),
                        suffixIcon: const ImageIcon(
                          AssetImage('assets/filter.png'),
                          size: 5,
                          color: Colors.grey,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18.0,
                          horizontal: 5.0,
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        height: 14.52 / 12,
                        letterSpacing: 0.1846153885126114,
                        color: Color.fromRGBO(187, 187, 188, 1),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.047,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Most Popular Beverages",
                      style: GoogleFonts.inter(
                        color: const Color.fromRGBO(182, 182, 182, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        height: 21.78 / 18,
                        letterSpacing: 0.2,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              // Scrollable row of cards
              BeverageCard(
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenHeight * 0.06),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text(
                      'Get it instantly',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        height: 21.78 / 18,
                        letterSpacing: 0.2,
                        color: const Color.fromRGBO(182, 182, 182, 1),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Scrollable column of cards
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 2, // You can change the number of cards here
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        width: 390,
                        height: 163,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(180, 180, 180, 0.33),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              offset: const Offset(0, 4),
                              blurRadius: 4,
                            ),
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(14)),
                        ),
                        child: Row(
                          children: [
                            // Text and details section
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 25.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Title and rating
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25.0),
                                      child: Text(
                                        'Lattè',
                                        style: GoogleFonts.inter(
                                          fontSize: 18, // font-size: 18px
                                          fontWeight: FontWeight
                                              .w400, // font-weight: 400 (normal)
                                          height: 21.78 /
                                              18, // line-height: 21.78px divided by font-size
                                          letterSpacing:
                                              0.2, // letter-spacing: 0.2px
                                          textStyle: const TextStyle(
                                            color: Color.fromRGBO(205, 205, 205,
                                                1), // Default color, change if needed
                                          ),
                                        ),
                                        textAlign:
                                            TextAlign.left, // text-align: left
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            '4.9',
                                            style:
                                                GoogleFonts.inter(fontSize: 14),
                                          ),
                                          const SizedBox(width: 2),
                                          const Icon(Icons.star,
                                              color: Colors.amber, size: 16),
                                          const SizedBox(width: 4),
                                          Text(
                                            '(458)',
                                            style:
                                                GoogleFonts.inter(fontSize: 14),
                                          ),
                                          const SizedBox(width: 4),
                                          Image.asset(
                                            'assets/veg.png', // Path to your image
                                            width: 16,
                                            height: 16,
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Description
                                    const SizedBox(height: 8),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25.0),
                                      child: Text(
                                        'Caffè latte is a milk coffee made up of one or two shots of espresso, steamed milk, and a final thin layer of frothed milk on top.',
                                        style: GoogleFonts.inter(
                                          fontSize: 10,
                                          color: const Color.fromRGBO(
                                              192, 192, 192, 1),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CoffeeDetailPage()),
                                    );
                                  },
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/latte.png'), // Change to your image path
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 120,
                                  left: 48,
                                  child: SizedBox(
                                    width: 52, // Set the width
                                    height: 19, // Set the height
                                    child: ElevatedButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text('Item added to basket!'),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.green, // Background color
                                        padding: EdgeInsets
                                            .zero, // Remove padding to fit text within the button
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                5), // Custom border radius
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        // Center the text inside the button
                                        child: Text(
                                          'ADD',
                                          style: GoogleFonts.inter(
                                            fontSize:
                                                8, // Appropriate font size
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // Add button
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
