import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/responsive.dart';
import 'package:portfolio/view/about/aboutWeb.dart';
import 'package:portfolio/view/about/aboutMobile.dart';
import 'package:portfolio/view/about/aboutTab.dart';
import 'package:portfolio/view/education/educationMobile.dart';
import 'package:portfolio/view/education/educationTab.dart';
import 'package:portfolio/view/education/educationWeb.dart';

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      webView: EducationWeb(),
      tabView: EducationTab(),
      mobileView: EducationMobile(),
    );
  }
}
