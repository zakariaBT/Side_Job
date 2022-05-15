import 'package:flutter/material.dart';
import 'package:side_job/constants.dart';
import 'package:side_job/size_config.dart';

import 'otp_form.dart';

class Body extends StatefulWidget {
  final String phoneNumber;
  const Body({Key? key, required this.phoneNumber}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              Text(
                "Code Verification",
                style: headingStyle,
              ),
              Text("We sent your code to +212${widget.phoneNumber.trim().substring(1,4)}******"),
              buildTimer(),
              OtpForm(phoneNumber: widget.phoneNumber),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 60.0, end: 0.0),
          duration: const Duration(seconds: 60),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
          ),
        ),
      ],
    );
  }
}
