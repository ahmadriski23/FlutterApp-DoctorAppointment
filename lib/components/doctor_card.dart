import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.route});
  final String route;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(route);
        },
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: Config.widthSize * 0.33,
                child: Image.network(
                  Config.imageDoctor1,
                  fit: BoxFit.fill,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr Richard Tan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Dental',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                            size: 16,
                          ),
                          Spacer(flex: 1),
                          Text('4.5'),
                          Spacer(flex: 1),
                          Text('Reviews'),
                          Spacer(
                            flex: 1,
                          ),
                          Text('(20)'),
                          Spacer(
                            flex: 7,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
