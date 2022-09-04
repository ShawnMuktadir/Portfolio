import 'package:flutter/material.dart';
import 'package:portfolio/model/educationModel.dart';
import 'package:portfolio/resource/styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/workModel.dart';

enum ScreenType { mobile, tab, web }

class AppClass {
  static final AppClass _mAppClass = AppClass._internal();
  static BuildContext? lastContext;
  ScrollController controller = ScrollController();

  /* URL */
  static final resumeDownloadURL =
      '''https://jeeva-portfolio.s3.amazonaws.com/JEEVANANDHAM's+Resume.pdf''';

  static final smartParkingURL =
      '''https://play.google.com/store/apps/details?id=www.fiberathome.com.parkingapp''';
  static final drobbooAndroidURL =
      '''https://play.google.com/store/apps/details?id=com.drobboo''';
  static final drobbooIOSURL =
      '''https://apps.apple.com/us/app/drobboo/id1583770282''';
  static final tappConsumerURL =
      '''https://play.google.com/store/apps/details?id=org.tappwaterapp.consumer''';
  static final tappProviderURL =
      '''https://play.google.com/store/apps/details?id=org.tappwaterapp.provider''';
  static final ponnoURL =
      '''https://play.google.com/store/apps/details?id=ponno.app''';
  static final saveLifeURL = '''https://github.com/ShawnMuktadir/SaveLife''';
  static final demoWebsiteURL = '''https://shawnmuktadir.github.io/''';

  List<WorkModel> projectList = [
    WorkModel(
        projectTitle: "DNCC Smart Parking",
        projectContent:
            "Android App that manages drivers to book their vehicles at the predefined parking spot location on the google map. Show routes between driver current location and parking spot location as well as search google places and find out nearby parking slots comparing that searched location",
        tech1: "Android",
        tech2: "Firebase",
        tech3: "Java"),
    WorkModel(
        projectTitle: "DROBBOO",
        projectContent:
            "E-Commerce website and mobile-end application name Drobboo.",
        tech1: "Flutter",
        tech2: "Firebase",
        tech3: "ReactJs"),
    WorkModel(
        projectTitle: "Tapp Water App",
        projectContent:
            '''Tapp-BDP is an app that assists the operation and maintenance of piped water supply systems in Bangladesh. Piped water supply consumers and water service providers both have their own app (Tapp- BDP Consumer or Tapp-BDP Service Provider) which communicates with each other and with a web application that is used to monitor the piped water supply from a distance.''',
        tech1: "Android",
        tech2: "Java",
        tech3: "Firebase"),
    WorkModel(
        projectTitle: "Ponno",
        projectContent:
            '''Android App that manages to track every business record up to date for businessmen. The Ponno app helps its users to understand all the ledgers easily.''',
        tech1: "Android",
        tech2: "Java",
        tech3: "Kotlin"),
    WorkModel(
        projectTitle: "SaveLife",
        projectContent:
            '''Android App that manages blood donors list and organization list that organize & manage blood donors. Blood seekers can find specific blood group donors by filtering options and contacting them via phone call.''',
        tech1: "Android",
        tech2: "Java",
        tech3: "Firebase"),
    WorkModel(
        projectTitle: "ShawnMuktadir.github.io",
        projectContent:
            '''A demo website using HTML5, CSS3, JavaScript, jQuery & Bootstrap''',
        tech1: "HTML5",
        tech2: "CSS3",
        tech3: "JavaScript"),
  ];

  List<EducationModel> educationList = [
    EducationModel(
        educationTitle: "Bachelor of Science (B.Sc.)",
        educationInstitution:
            "Chittagong University of Engineering & Technology (CUET)",
        educationPeriod:
            "Computer Science & Engineering (2012 - 2017)",
    educationImage: "assets/svg/cuet.png"),
    EducationModel(
        educationTitle: "Higher Secondary School Certificate (H.S.C)",
        educationInstitution: "Dhaka City College (DCC)",
        educationPeriod: "Group: Science (2009-2011)",
        educationImage: "assets/svg/dcc.png"),
    EducationModel(
        educationTitle: "Secondary School Certificate (S.S.C)",
        educationInstitution:
            '''Dhanmondi Government Boys' High School (DGBHS)''',
        educationPeriod: "Group: Science (Till 2009)",
        educationImage: "assets/svg/dgbhs.jpg"),
  ];

  factory AppClass() {
    return _mAppClass;
  }

  AppClass._internal();

  getMqWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  getMqHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  showSnackBar(String msg, {BuildContext? context}) {
    ScaffoldMessenger.of(context ?? lastContext!)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  ScreenType getScreenType(BuildContext context) {
    double scrWidth = getMqWidth(context);
    if (scrWidth > 915) {
      return ScreenType.web;
    } else if (scrWidth < 650) {
      return ScreenType.mobile;
    }
    return ScreenType.tab;
  }

  downloadResume(context) async {
    await launchUrl(Uri.parse(AppClass.resumeDownloadURL));
  }

  alertDialog(context, title, msg) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
                title: Text(title, style: TxtStyle().boldWhite(context)),
                content: Text(msg),
                actions: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () => Navigator.pop(context),
                      child: Text('Okay'))
                ]));
  }
}
