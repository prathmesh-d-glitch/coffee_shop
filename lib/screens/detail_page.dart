import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeDetailPage extends StatefulWidget {
  @override
  _CoffeeDetailPageState createState() => _CoffeeDetailPageState();
}

class _CoffeeDetailPageState extends State<CoffeeDetailPage> {
  int _selectedQuantity = 1; // Default value for quantity selection
  int _selectedIndex = -1; // For cup filling selection
  bool _isHighPriority = false;
  List<String> quantity = [
    'Full',
    '1/2 Full',
    '3/4 Full',
    '1/4 Full'
  ]; // Options for cup filling
  final List<bool> _isSelected =
      List.generate(8, (index) => false); // Toggle button states
  final List<bool> _isSelectedSugar = List.generate(4, (index) => false);

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index for cup filling
    });
  }

  Widget _buildFloatingTab() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(51, 51, 51, 0.84),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Checkbox(
                side: const BorderSide(color: Color.fromRGBO(236, 236, 236, 1),),
                value: _isHighPriority,
                onChanged: (bool? value) {
                  setState(() {
                    _isHighPriority = value!;
                  });
                },
                activeColor: Colors.green,
                checkColor: Colors.white,
              ),
              Text(
                'High Priority',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Handle Submit action
                  print('Submit tapped!');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(int index, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected[index] = !_isSelected[index]; // Toggle the state
        });
      },
      child: Row(
        children: [
          Container(
            width: 40, // Make the toggle small
            height: 20, // Height of the toggle
            padding:
                EdgeInsets.all(2), // Padding inside the toggle for the circle
            decoration: BoxDecoration(
              gradient: _isSelected[index]
                  ? const LinearGradient(
                      colors: [
                        Color.fromRGBO(
                            35, 133, 68, 1), // Green gradient when enabled
                        Color.fromRGBO(81, 224, 104, 1),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                  : const LinearGradient(
                      colors: [
                        Color.fromRGBO(
                            91, 91, 91, 1), // Gray gradient when disabled
                        Color.fromRGBO(186, 186, 186, 1),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
              borderRadius: BorderRadius.circular(20), // Round shape
            ),
            child: AnimatedAlign(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              alignment: _isSelected[index]
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                width: 16, // Circle size
                height: 16,
                decoration: const BoxDecoration(
                  color: Colors.white, // Circle color
                  shape: BoxShape.circle, // Circle shape
                ),
              ),
            ),
          ),
          SizedBox(width: 12), // Space between the button and text
          Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: const Color.fromRGBO(205, 205, 205, 1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButtonSugar(int index, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelectedSugar[index] =
              !_isSelectedSugar[index]; // Toggle the state
        });
      },
      child: Row(
        children: [
          Container(
            width: 40, // Make the toggle small
            height: 20, // Height of the toggle
            padding:
                EdgeInsets.all(2), // Padding inside the toggle for the circle
            decoration: BoxDecoration(
              gradient: _isSelectedSugar[index]
                  ? const LinearGradient(
                      colors: [
                        Color.fromRGBO(
                            35, 133, 68, 1), // Green gradient when enabled
                        Color.fromRGBO(81, 224, 104, 1),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                  : const LinearGradient(
                      colors: [
                        Color.fromRGBO(
                            91, 91, 91, 1), // Gray gradient when disabled
                        Color.fromRGBO(186, 186, 186, 1),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
              borderRadius: BorderRadius.circular(20), // Round shape
            ),
            child: AnimatedAlign(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              alignment: _isSelectedSugar[index]
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                width: 16, // Circle size
                height: 16,
                decoration: const BoxDecoration(
                  color: Colors.white, // Circle color
                  shape: BoxShape.circle, // Circle shape
                ),
              ),
            ),
          ),
          SizedBox(width: 12), // Space between the button and text
          Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: const Color.fromRGBO(205, 205, 205, 1),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: screenHeight,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/beans.jpeg'), // Background image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 6.5, // Horizontal blur radius
                    sigmaY: 6.5, // Vertical blur radius
                  ),
                  child: Container(
                    height: screenHeight,
                    color: Colors.white.withOpacity(0.12),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Image.asset(
                    'assets/latte2.png',
                    width: MediaQuery.of(context).size.width,
                    height: screenHeight * 0.38,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.38,
                  left: 0,
                  right: 0, // Allow it to stretch horizontally
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            'Lattè',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(205, 205, 205, 1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            children: [
                              Text(
                                '4.9',
                                style: GoogleFonts.inter(fontSize: 14),
                              ),
                              const SizedBox(width: 2),
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                '(458)',
                                style: GoogleFonts.inter(fontSize: 14),
                              ),
                              const SizedBox(width: 7),
                              Image.asset(
                                'assets/veg.png', // Path to your image
                                width: 16,
                                height: 16,
                              ),
                              Spacer(), // Use Spacer to push the dropdown to the right
                              Container(
                                width: 40,
                                height: 27,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                ),
                                child: DropdownButton<int>(
                                  value: _selectedQuantity,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(color: Colors.black),
                                  underline: Container(),
                                  onChanged: (int? newValue) {
                                    setState(() {
                                      _selectedQuantity = newValue!;
                                    });
                                  },
                                  items: <int>[1, 2, 3, 4]
                                      .map<DropdownMenuItem<int>>((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Caffè latte is a milk coffee that is made up of one or two shots of espresso, steamed milk, and a final, thin layer of frothed milk on top.',
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  color: const Color.fromRGBO(192, 192, 192, 1),
                                ),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Choice of Cup Filling',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromRGBO(205, 205, 205, 1),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(
                                  4,
                                  (index) {
                                    return GestureDetector(
                                      onTap: () => _onButtonPressed(
                                          index), // Handle button press
                                      child: Container(
                                        width: 65,
                                        height: 27,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: (index == 0)
                                                ? 0
                                                : 6), // Add spacing between buttons
                                        decoration: BoxDecoration(
                                          color: _selectedIndex == index
                                              ? const Color.fromRGBO(
                                                  55, 173, 84, 1)
                                              : Colors
                                                  .white, // Change color based on selection
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              color: Colors
                                                  .black), // Optional: Add border
                                        ),
                                        child: Center(
                                          child: Text(
                                            quantity[index],
                                            style: TextStyle(
                                              color: _selectedIndex == index
                                                  ? Colors.white
                                                  : Colors
                                                      .black, // Change text color based on selection
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Choice of Add-ons',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromRGBO(205, 205, 205, 1),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Ensures left alignment within the column
                                    children: [
                                      _buildToggleButton(0, 'Skim Milk'),
                                      SizedBox(height: 16),
                                      _buildToggleButton(2, 'Almond Milk'),
                                      SizedBox(height: 16),
                                      _buildToggleButton(4, 'Soy Milk'),
                                      SizedBox(height: 16),
                                      _buildToggleButton(
                                          6, 'Lactose Free Milk'),
                                      SizedBox(height: 16),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Ensures left alignment within the column
                                    children: [
                                      _buildToggleButton(1, 'Full Cream Milk'),
                                      SizedBox(height: 16),
                                      _buildToggleButton(3, 'Full Cream Milk'),
                                      SizedBox(height: 16),
                                      _buildToggleButton(5, 'Oat Milk'),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Choice of Sugar',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromRGBO(205, 205, 205, 1),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Ensures left alignment within the column
                                    children: [
                                      _buildToggleButtonSugar(0, 'Sugar X1'),
                                      SizedBox(height: 16),
                                      _buildToggleButtonSugar(1, '½ Sugar'),
                                      SizedBox(height: 16),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 70,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Ensures left alignment within the column
                                    children: [
                                      _buildToggleButtonSugar(2, 'Sugar X2'),
                                      SizedBox(height: 16),
                                      _buildToggleButtonSugar(3, 'No Sugar'),
                                      SizedBox(height: 16),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.transparent, // Makes the container transparent
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildFloatingTab(),
    );
  }
}
