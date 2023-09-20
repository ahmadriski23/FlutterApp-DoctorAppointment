import 'package:flutter/material.dart';

import '../utils/config.dart';

class SocialButton extends StatelessWidget {
  const SocialButton(
      {super.key, required this.imageNetwork, required this.name});

  final String imageNetwork;
  final String name;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: 5,
          ),
          side: BorderSide(width: 1, color: Colors.black),
        ),
        onPressed: () {},
        child: SizedBox(
          width: Config.widthSize * 0.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                '$imageNetwork',
                width: 40,
                height: 40,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 6.0,
              ),
              Text(
                name,
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ));
  }
}
// facebook 
// https://i.pinimg.com/236x/8f/5c/e2/8f5ce27564945d2c9a10ef827549a78c.jpg

// google 
// https://i.pinimg.com/236x/45/20/dd/4520ddfc56208707045c56232e946f7f.jpg