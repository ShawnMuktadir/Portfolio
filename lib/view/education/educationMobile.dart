import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/generalController.dart';
import '../../resource/appClass.dart';
import '../../resource/colors.dart';

class EducationMobile extends ConsumerStatefulWidget {
  const EducationMobile({Key? key}) : super(key: key);

  @override
  ConsumerState<EducationMobile> createState() => _EducationMobileState();
}

class _EducationMobileState extends ConsumerState<EducationMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: AppClass().getMqWidth(context) * 0.1,
          right: AppClass().getMqWidth(context) * 0.1),
      padding: EdgeInsets.only(bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    text: "02.",
                    style: TextStyle(
                        color: AppColors().neonColor,
                        fontSize: 20,
                        fontFamily: 'sfmono'),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Education',
                        style: GoogleFonts.robotoSlab(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )
                    ]),
              ),
              Container(
                height: 0.5,
                margin: EdgeInsets.only(left: 15),
                width: AppClass().getMqWidth(context) * 0.2,
                color: AppColors().textLight,
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
            child: StaggeredGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              axisDirection: AxisDirection.down,
              children: [
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 2,
                  child: Tile(index: 0),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 2,
                  child: Tile(index: 1),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 2,
                  child: Tile(index: 2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Tile({required int index}) {
    return InkWell(
      onTap: () {},
      onHover: (bool) {
        if (bool) {
          ref.read(hoverProvider.notifier).state = "$index";
        } else {
          ref.read(hoverProvider.notifier).state = "";
        }
      },
      child: Consumer(builder: (context, ref, child) {
        String data = ref.watch(hoverProvider);
        bool isHovered = (data == "$index");
        return Container(
          padding: EdgeInsets.all(5.0),
          margin: EdgeInsets.all(isHovered ? 4.0 : 0.0),
          child: Card(
            color: AppColors().cardColor,
            elevation: 10,
            child: Container(
              height: 700,
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Consumer(builder: (context, ref, child) {
                    var data = ref.watch(hoverProvider);
                    bool isHovered = (data == "educationalInstitutionPic");
                    return Stack(
                      children: [
                        Container(
                          width: AppClass().getMqWidth(context) *
                              (isHovered ? 0.22 : 0.225),
                          height: AppClass().getMqWidth(context) *
                              (isHovered ? 0.22 : 0.225),
                          margin: EdgeInsets.only(top: 5, left: 5),
                          padding: EdgeInsets.only(top: 5, left: 5),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              border: Border.all(
                                  color: AppColors().neonColor, width: 1.5)),
                        ),
                        InkWell(
                          onTap: () {},
                          onHover: (bol) {
                            if (bol) {
                              ref.read(hoverProvider.notifier).state =
                                  "educationalInstitutionPic";
                            } else {
                              ref.read(hoverProvider.notifier).state = "";
                            }
                          },
                          child: Container(
                            width: AppClass().getMqWidth(context) * 0.22,
                            height: AppClass().getMqWidth(context) * 0.22,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        AppColors().primaryColor,
                                        isHovered
                                            ? BlendMode.lighten
                                            : BlendMode.color),
                                    image: AssetImage(AppClass()
                                        .educationList[index]
                                        .educationImage
                                        .toString())),
                                color: Colors.transparent),
                          ),
                        ),
                      ],
                    );
                  }),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 2.0),
                      child: Text(
                        AppClass()
                            .educationList[index]
                            .educationTitle
                            .toString(),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: GoogleFonts.robotoSlab(
                            color: isHovered
                                ? AppColors().neonColor
                                : Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 2.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 2.0),
                        child: Text(
                          AppClass()
                              .educationList[index]
                              .educationInstitution
                              .toString(),
                          textAlign: TextAlign.left,
                          maxLines: 3,
                          style: GoogleFonts.roboto(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 2.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
                        child: Text(
                          AppClass()
                              .educationList[index]
                              .educationPeriod
                              .toString(),
                          textAlign: TextAlign.left,
                          maxLines: 3,
                          style: GoogleFonts.roboto(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
