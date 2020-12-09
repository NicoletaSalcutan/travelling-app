import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelling_app/utils/appcolor.dart';
import 'package:travelling_app/utils/strings.dart';
import 'package:travelling_app/utils/textStyles.dart';

import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 64.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Container for header
            Container(
              width: double.infinity,
              child: Stack(
                children: [
                  ///Container for welcoming text
                  Container(
                    child: Column(
                      children: [
                        Text(
                          Strings.hiNicole,
                          style: poppins18Light,
                        ),
                        Text(
                          Strings.message,
                          style: playfairDisplay32Dark,
                        ),
                      ],
                    ),
                  ),

                  ///Profile for welcoming text
                  Positioned(
                    child: CircleAvatar(
                      radius: 30.0,
                      child: ClipOval(
                        child: Image.asset("assets/images/nico.png"),
                      ),
                    ),
                    right: 0,
                    top: 0,
                  ),
                ],
              ),
            ),

            ///Vertical spacing
            SizedBox(
              height: 16.0,
            ),

            ///Container for actionables
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.top,
                    style: poppins16lightGreen,
                  ),
                  Text(
                    Strings.forYou,
                    style: poppins16light,
                  ),
                  Text(
                    Strings.hiddenGems,
                    style: poppins16light,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: AppColor.lightGreenColor,
                      ),
                      onPressed: () {}),
                ],
              ),
            ),

            ///Vertical spacing
            SizedBox(
              height: 16.0,
            ),

            ///Container for places list
            Expanded(
              child: Container(
                child: LayoutGrid(
                  columnGap: 12,
                  rowGap: 12,
                  templateColumnSizes: [
                    FlexibleTrackSize(1),
                    FlexibleTrackSize(1),

                    ///means half size or 50% to both columns
                  ],
                  templateRowSizes: [
                    ///three rows
                    FlexibleTrackSize(1),
                    FlexibleTrackSize(0.6),
                    FlexibleTrackSize(1),

                    ///means first and third row will share space but second will take 1/6 height compare to others
                  ],
                  children: [
                    ///Lets make container for each elements
                    getPlaceWidget("assets/5.svg").withGridPlacement(rowStart: 0, columnStart: 0, rowSpan: 2),
                    getPlaceWidget("assets/3.svg").withGridPlacement(rowStart: 2, columnStart: 0, rowSpan: 1),
                    getPlaceWidget("assets/2.svg").withGridPlacement(rowStart: 0, columnStart: 1, rowSpan: 1),
                    getPlaceWidget("assets/4.svg").withGridPlacement(rowStart: 1, columnStart: 1, rowSpan: 2),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getPlaceWidget(imagePath) {
    return GestureDetector(
      onTap: () {
        ///For going on next screen
        Navigator.push(
            context,
            MaterialPageRoute(

                ///Send image path as we have setted it as tag of hero
                builder: (context) => DetailScreen(imagePath)));
      },
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColor.lightRedColor),
          child: Stack(
            children: [
              Hero(
                ///For hero animation on route transition
                tag: imagePath,
                child: ClipRRect(
                  child: SvgPicture.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              ///For rating and title
              Positioned(
                top: 16,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Paris",
                      style: GoogleFonts.poppins(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
                    ),

                    ///Rating
                    Chip(
                      backgroundColor: Colors.white,
                      label: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColor.lightGreenColor,
                            size: 15,
                          ),

                          ///For  space
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "4.0",
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: AppColor.verylightTextColor, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
