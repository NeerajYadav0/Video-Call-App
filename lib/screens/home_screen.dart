import 'package:flutter/material.dart';
import 'package:video_call/resources/auth_methods.dart';
import 'package:video_call/screens/history_meeting_screen.dart';
import 'package:video_call/screens/meeting_screen.dart';
import 'package:video_call/utils/colors.dart';
import 'package:video_call/widgets/custom_button.dart';
import 'package:video_call/widgets/home_meeting_button.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    
    MeetingScreen(),
    const HistoryMeetingScreen(),
    const Text('Contacts'),
    CustomButton(text: 'Log Out', onPressed: () => {AuthMethods().signOut()}),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text('Meet & Chat'),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment_bank,
            ),
            label: 'Meet & Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock,
            ),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
  }

class HistoryMeeting extends StatelessWidget {
  const HistoryMeeting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HomeMeetingButton(onPressed: (){}, icon: Icons.videocam, text: 'New Meeting'),
          HomeMeetingButton(onPressed: (){}, icon: Icons.add_box_rounded, text: 'Join Meeting'),
          HomeMeetingButton(onPressed: (){}, icon: Icons.calendar_today, text: 'Schedule Meeting'),
          HomeMeetingButton(onPressed: (){}, icon: Icons.arrow_upward_rounded, text: 'Share Screen'),
        ],
      ),
      const Expanded(child: Center(child: Text('Create or Join Meetings with just a click!', style: TextStyle(fontWeight: FontWeight.bold,fontSize:18 ), ),))
    ]);
  }
}
