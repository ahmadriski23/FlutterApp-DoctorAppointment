import 'package:doctor_appointment_app/components/appointment_card.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.upcoming; // * initial status
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedules = [
    {
      "doctor_name": "Richard Tan",
      "doctor_profile": Config.imageDoctor1,
      "category": "Dental",
      "status": FilterStatus.upcoming,
    },
    {
      "doctor_name": "Max Lim",
      "doctor_profile": Config.imageDoctor2,
      "category": "Cardiology",
      "status": FilterStatus.complete,
    },
    {
      "doctor_name": "Jane Wong",
      "doctor_profile": Config.imageDoctor3,
      "category": "Respiration",
      "status": FilterStatus.complete,
    },
    {
      "doctor_name": "Jehny Song",
      "doctor_profile": Config.imageDoctor4,
      "category": "Dental",
      "status": FilterStatus.cancel,
    },
  ];
  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules = schedules.where((var schedule) {
      return schedule['status'] == status;
    }).toList();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Appointment Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (filterStatus == FilterStatus.upcoming) {
                                  status = FilterStatus.upcoming;
                                  _alignment = Alignment.centerLeft;
                                } else if (filterStatus ==
                                    FilterStatus.complete) {
                                  status = FilterStatus.complete;
                                  _alignment = Alignment.center;
                                } else if (filterStatus ==
                                    FilterStatus.cancel) {
                                  status = FilterStatus.cancel;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(child: Text(filterStatus.name)),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: AnimatedAlign(
                    alignment: _alignment,
                    duration: Duration(milliseconds: 200),
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Config.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          status.name,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Config.spaceSmall,
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: ((context, index) {
                  var _schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;

                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: !isLastElement
                        ? EdgeInsets.only(bottom: 20)
                        : EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(_schedule['doctor_profile']),
                              ),
                              Config.spaceSmall,
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _schedule['doctor_name'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      _schedule['category'],
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ScheduleCard(),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Config.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Config.primaryColor,
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'Reschedule',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )))
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
