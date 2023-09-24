import 'package:flutter/material.dart';

class Config {
  static const imageDoctor =
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60';
  // * color
  static const primaryColor = Color.fromARGB(255, 29, 182, 146);

  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  // * width and height initialization
  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData!.size.width;
    screenHeight = mediaQueryData!.size.height;
  }

  static get widthSize {
    return screenWidth;
  }

  static get heightSize {
    return screenHeight;
  }

  // * define spacing height
  static const spaceSmall = SizedBox(
    height: 25,
  );

  static final spaceMedium = SizedBox(
    height: screenHeight! * 0.05,
  );
  static final spaceBig = SizedBox(
    height: screenHeight! * 0.08,
  );

  // * textfromfield border
  static const outlinedBorder =
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)));

  static const focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(color: Config.primaryColor));

  static const errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(color: Colors.red));
}
