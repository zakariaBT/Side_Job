import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:side_job/Account/Settings/settings_screen.dart';
import 'package:side_job/Account/User_Info/user_info_screen.dart';
import 'package:side_job/screens/Home/StartPage.dart';
import 'package:side_job/screens/Home/visit_us_screen.dart';
import 'package:side_job/screens/sign_in/sign_in_screen.dart';

import '../../Account/LocalAuth/local_auth_screen.dart';
import '../../constants.dart';
import '../../enums.dart';
import 'Home.dart';
import 'components/ProfilePic.dart';
import 'components/profile_menu.dart';
import 'components/Bottom_Nav_Bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({this.sidebarMenu = false});

  final bool sidebarMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(fontSize: 18)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 40),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () => {
                if (sidebarMenu) Navigator.pop(context),
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserInfoScreen()),
                )
              },
              verticalPadding: sidebarMenu ? 7 : 10,
            ),
            /* ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),*/
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () => {
                if (sidebarMenu) Navigator.pop(context),
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                )
              },
              verticalPadding: sidebarMenu ? 7 : 10,
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () {},
            ),
            sidebarMenu
                ? ProfileMenu(
              text: 'Visit Us',
              icon: "assets/icons/Heart Icon.svg",
              press: () {
                if (sidebarMenu) Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SocialMedia()));
              },
              verticalPadding: 7,
            )
                : const SizedBox(
              height: 0,
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () async {
                await auth.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => FingerprintPage()),
                        (Route<dynamic> route) => false);
              },
              verticalPadding: sidebarMenu ? 7 : 10,
            ),
          ],
        ),
      ),
      bottomNavigationBar: sidebarMenu
          ? null
          : const BottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
