import 'package:eventing_/views/DemoApp.dart';
import 'package:eventing_/views/v_formlogin.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  // DateTime today = DateTime.now();
  // void _onDaySelected(DateTime day, DateTime focusedDay) {
  //   setState(() {
  //     today = day;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Eventing'),
      ),
      body: DemoApp(),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.red,
              alignment: Alignment.center,
              child: Text(
                'menu profile',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return HomePage();
                //     },
                //   ),
                // );
              },
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            ListTile(
              onTap: (() {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return SettingPage();
                //     },
                //   ),
                // );
              }),
              leading: Icon(Icons.settings),
              title: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            ListTile(
              onTap: (() {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return formlogin();
                    },
                  ),
                );
              }),
              leading: Icon(Icons.account_circle_rounded),
              title: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Kalender',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_agenda),
            label: 'Agenda',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
  // Widget content() {
  //   return Padding(
  //     padding: const EdgeInsets.all(20.0),
  //     child: Column(
  //       children: [
  //         Text(
  //           'Selected Day : ' + today.toString().split(" ")[0],
  //           style: TextStyle(fontSize: 20),
  //         ),
  //         Container(
  //           child: TableCalendar(
  //             locale: "en_US",
  //             rowHeight: 43,
  //             headerStyle:
  //                 HeaderStyle(formatButtonVisible: false, titleCentered: true),
  //             availableGestures: AvailableGestures.all,
  //             selectedDayPredicate: (day) => isSameDay(day, today),
  //             focusedDay: today,
  //             firstDay: DateTime.utc(2010, 10, 16),
  //             lastDay: DateTime.utc(2030, 3, 14),
  //             onDaySelected: _onDaySelected,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////