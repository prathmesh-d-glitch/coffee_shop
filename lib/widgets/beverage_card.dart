import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:google_fonts/google_fonts.dart'; // For ImageFilter

class BeverageCard extends StatelessWidget {
  final double screenWidth;

  const BeverageCard({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 265, // Fixed height
      width: screenWidth, // Fixed width
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3, // Number of cards
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 5 : 18, // Left padding for the first item
              right: 0, // No right padding for the last card
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
                child: Container(
                  width: 213, // Card width fixed
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.36),
                        Color.fromRGBO(255, 255, 255, 0.18),
                        Color.fromRGBO(255, 255, 255, 0.3),
                      ],
                    ), // Adjusted opacity
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.33), // White border
                      width: 1, // Border width
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        offset: const Offset(2, 2), // Shadow offset
                        blurRadius: 4, // Blur radius
                        spreadRadius: -1, // Spread radius
                      ),
                    ], // Shadow
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Beverage Image
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: Container(
                          width: 213 * 0.57, // Image container width
                          height: 265 * 0.45, // Image container height
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(
                                    29, 29, 29, 0.25), // Shadow color
                                offset: Offset(12, 12), // Shadow offset
                                blurRadius: 10, // Shadow blur
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/coffee${index + 1}.png', // Replace with beverage image paths
                            fit: BoxFit.cover, // Fit image to container
                          ),
                        ),
                      ),
                      const SizedBox(height: 25), // Spacing below image

                      // Beverage Name
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Hot Cappuccino', // Beverage name
                          style: GoogleFonts.inter(
                            color: const Color.fromRGBO(205, 205, 205, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 18, // Change to match the 18px size
                            height:
                                21.78 / 18, // Line height divided by font size
                            letterSpacing: 0.2, // Match the letter-spacing
                          ),
                          textAlign: TextAlign.left, // Align to the left
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // Beverage Description
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Espresso, Steamed Milk',
                          style: TextStyle(
                            fontFamily: 'Inter', // Set font-family to Inter
                            color: Color.fromRGBO(
                                48, 48, 48, 1), // Text color (dark gray)
                            fontSize: 10, // Match 10px font size
                            fontWeight:
                                FontWeight.w400, // Set to font-weight 400
                            height:
                                12.1 / 10, // Line height divided by font size
                            letterSpacing: 0.2, // Match letter-spacing
                          ),
                          textAlign: TextAlign.left, // Align to the left
                        ),
                      ),

                      const SizedBox(height: 5), // Spacing below description

                      // Rating and Review Count
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '4.9',
                              style: GoogleFonts.inter(
                                color: Colors.black, // White color
                                fontSize: 12, // Font size 12px
                                fontWeight:
                                    FontWeight.w300, // Font weight 300 (light)
                                height: 14.52 /
                                    12, // Line height: 14.52px calculated
                              ),
                              textAlign:
                                  TextAlign.left, // Align text to the left
                            ),
                            const SizedBox(width: 2),
                            const Icon(Icons.star,
                                color: Colors.yellow, size: 14),
                            const SizedBox(
                                width: 4), // Space between rating and count
                            Text(
                              '(458)', // Review count
                              style: GoogleFonts.inter(
                                color: Colors.black, // Slightly dimmed white
                                fontSize: 12,
                                fontWeight: FontWeight.w300, // Font weight 300
                                height: 14.52 /
                                    12, // Line height: 14.52px with respect to font size
                              ),
                              textAlign:
                                  TextAlign.left, // Align text to the left
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Add Button
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            // Show a message when the button is tapped
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Item added to basket!'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                right: 11), // Right margin
                            decoration: const BoxDecoration(
                              color: Colors.green,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
