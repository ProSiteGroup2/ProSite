

import 'package:flutter/material.dart';
import 'package:group2/common/color.dart';
import 'package:group2/common/size.dart';

/*
 *  BUTTON STYLE
 */

ButtonStyle kMutableButtonStyle(
        BuildContext context, double width, double height) =>
    ElevatedButton.styleFrom(
      onPrimary: Colors.white,
      elevation: 0,
      primary: kPrimaryColor,
      minimumSize: Size(width, height),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );

// Login Button
ButtonStyle loginButtonStyle(BuildContext context) => ElevatedButton.styleFrom(
      onPrimary: Colors.white,
      primary: kPrimaryColor,
      minimumSize: Size(kPropWidth(context, 1.0), 50),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );

// Google Button Style
ButtonStyle googleButtonStyle(BuildContext context) => ElevatedButton.styleFrom(
      onPrimary: kGrayColor,
      textStyle: kTextStyle,
      primary: Colors.white,
      minimumSize: Size(kPropWidth(context, 1.0), 50),
      shadowColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );

// Text Button Style
ButtonStyle textButtonStyle(BuildContext context) => ElevatedButton.styleFrom(
      onPrimary: kPrimaryColor,
      primary: Colors.white,
      shadowColor: null,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      textStyle: kTextStyle,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );

// Text outlin Style
ButtonStyle outlineButtonStyle(BuildContext context) =>
    ElevatedButton.styleFrom(
      onPrimary: kWhiteColor,
      primary: kWhiteColor.withOpacity(0.0),
      shadowColor: null,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      textStyle: kTextStyle,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: kWhiteColor, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );

/*
 * TEXT STYLE
 */

const kTextStyle = TextStyle(fontFamily: "poppins", color: kGrayColor);

const kTopicTextStyle = TextStyle(
  color: kDarkBlue,
  fontWeight: FontWeight.w600,
  fontSize: 32.0,
  fontFamily: "poppins",
);

const kButtonTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 16.0,
  fontFamily: "poppins",
);

const kH1TextStyle = TextStyle(
  color: kSecondaryColor,
  fontWeight: FontWeight.w400,
  fontSize: 16.0,
  fontFamily: "poppins",
);

const kH2TextStyle = TextStyle(
  color: kGrayColor,
  fontWeight: FontWeight.w400,
  fontSize: 14.0,
  fontFamily: "poppins",
);

const kBodyTextStyle = TextStyle(
  color: kSecondaryColor,
  fontWeight: FontWeight.w400,
  fontSize: 10.0,
  fontFamily: "poppins",
);

const kTitleTextStyle = TextStyle(
  color: kBlackColor,
  fontWeight: FontWeight.w500,
  fontSize: 24.0,
  fontFamily: "poppins",
);

/*
*  INPUT BOARDER STYLE
*/

const kInputBorderStyle =
    OutlineInputBorder(borderSide: BorderSide(color: kGrayLightColor));

const kInputUnderlineBorderStyle = UnderlineInputBorder(
  borderSide: BorderSide(
    color: kGrayLightColor,
    width: 0.5,
  ),
);

OutlineInputBorder kInputWhiteRoundedBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.0),
  borderSide: const BorderSide(color: kWhiteColor),
);

OutlineInputBorder kDefaultInputRoundedBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.0),
  borderSide: const BorderSide(color: kGrayColor),
);
