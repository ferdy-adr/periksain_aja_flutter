import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String userName;

  const HomeScreen({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Hello!',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 160,
                          child: Card(
                            elevation: 0.0,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.grey,
                            child: Image.asset(
                              'assets/images/banner-1.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 16.0,
                  ),
                  child: Row(
                    children: const [
                      Text(
                        'Services',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Expanded(
                          child: BoxMenu(
                              title: 'Appointment Schedule',
                              icon: 'assets/icons/calendar-plus.png'),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: BoxMenu(
                              title: 'My Healt',
                              icon: 'assets/icons/person.png'),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: BoxMenu(
                              title: 'History',
                              icon: 'assets/icons/order-history.png'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Expanded(
                          child: BoxMenu(
                              title: 'Pharmacy',
                              icon: 'assets/icons/pills.png'),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: BoxMenu(
                              title: 'Notification',
                              icon: 'assets/icons/alarm.png'),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: BoxMenu(
                              title: 'Message',
                              icon: 'assets/icons/open-message.png'),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Row(
                    children: const [
                      Text(
                        'Upcoming Appointments',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            AppointmentBox(
                                date: '19',
                                time: '09:13 AM',
                                doctorName: 'dr. Sarah Widiawati, Sp.KG'),
                            AppointmentBox(
                                date: '23',
                                time: '09:13 AM',
                                doctorName: 'dr. Sarah Widiawati, Sp.KG'),
                            AppointmentBox(
                                date: '29',
                                time: '09:13 AM',
                                doctorName: 'dr. Sarah Widiawati, Sp.KG'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BoxMenu extends StatelessWidget {
  final String title;
  final String icon;

  const BoxMenu({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 115,
        child: Card(
          elevation: 0.0,
          color: Colors.blueGrey[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 2.0),
            child: Column(
              children: [
                Image.asset(
                  icon,
                  height: 50.0,
                  width: 50.0,
                ),
                const SizedBox(height: 10.0),
                Text(
                  title,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppointmentBox extends StatelessWidget {
  final String date, time, doctorName;
  const AppointmentBox(
      {Key? key,
      required this.date,
      required this.time,
      required this.doctorName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SizedBox(
        width: 280,
        child: Card(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          color: Colors.lightBlue[900],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: [
                SizedBox(
                  height: 75,
                  width: 75,
                  child: Card(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    color: Colors.blue[800],
                    child: Center(
                      child: Text(
                        date,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        // fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    SizedBox(
                      width: 145,
                      child: Text(
                        doctorName,
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.more_horiz_rounded,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
