import 'package:flutter/material.dart';
import 'dart:ui';
import 'cart.dart';
//import 'package:flutter_firebase_series/screens/insert_data.dart';

class MobilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenWidth*90,//710,
            width: screenWidth*10,//430,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/759661a0c2eb97d6784c12fbdb8b0924.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              top:40,
              left: 90,
              child: Text(
                "Recycle Phone",
                style: TextStyle(
                  fontSize: 40,
                 fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent,
                  shadows: [
                    Shadow(
                      color: Colors.black,      // Shadow color
                      offset: Offset(2, 2),     // Shadow offset (X, Y)
                      blurRadius: 3.0,          // Shadow blur radius
                    ),
                  ],
                ),

              ),
          ),
          Positioned(
            top: 40,
            left: 15,
            child: GestureDetector(
              onTap: () {
                // Navigate back to the main page
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/images/Screenshot 2023-08-20 181147.png',
                width: 60,
                height: 60,
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  width: 330,
                  height: 580,
                  color: Colors.black.withOpacity(0.3),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Positioned(

                          child: Text(
                            "Recycle Phone",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.orangeAccent,
                              shadows: [
                                Shadow(
                                  color: Colors.black,      // Shadow color
                                  offset: Offset(2, 2),     // Shadow offset (X, Y)
                                  blurRadius: 3.0,          // Shadow blur radius
                                ),
                              ],
                            ),

                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Brand',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Usage',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Cartpage(),
                              ),
                            );
                          },
                          child: Text('Submit'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )


        ],
      ),
    );
  }
}
