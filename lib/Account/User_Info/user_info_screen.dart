import 'package:flutter/material.dart';

import 'components/body.dart';

class UserInfoScreen extends StatelessWidget {
  static String routeName = "/complete_profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0,
      ),
      body: Body(),
    );
  }
}
