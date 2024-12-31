import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'package:water_reminder_app/const.dart';
import 'package:water_reminder_app/cubit/home_page_cubit.dart';
import 'package:water_reminder_app/custom_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomePageCubit>(context).initializeSharedPreferences();

    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  FontAwesomeIcons.weightScale,
                  size: 22,
                  color: Colors.white,
                ),
                iconSize: 28,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const CustomAlertDialog();
                    },
                  );
                },
              ),
              title: const Text(
                "Drink Water Reminder",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              centerTitle: true,
              backgroundColor: kPrimaryColor,
            ),
            body: BlocProvider.of<HomePageCubit>(context).firstTime == true
                ? const CustomAlertDialogForFirstRun()
                : Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blue[50]!, Colors.white],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          tileMode: TileMode.mirror),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SleekCircularSlider(
                          innerWidget: (percentage) {
                            return percentage !=
                                    (BlocProvider.of<HomePageCubit>(context)
                                            .userWeight *
                                        35)
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "${percentage.toInt()} ",
                                              style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                            TextSpan(
                                              text: "ml",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey[800],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  "${(BlocProvider.of<HomePageCubit>(context).userWeight * 35)} ",
                                              style: TextStyle(
                                                fontSize: 34,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                            TextSpan(
                                              text: "ml",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey[800],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  "${(BlocProvider.of<HomePageCubit>(context).userWeight * 35)} ",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey[700],
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "ml",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey[800],
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  "${(BlocProvider.of<HomePageCubit>(context).userWeight * 35)} ",
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey[700],
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "ml",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey[800],
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "Come back\ntomorow ",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.green[400],
                                          fontStyle: FontStyle.normal,
                                          shadows: const [
                                            Shadow(
                                                color: Colors.black,
                                                blurRadius: 2)
                                          ],
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  );
                          },
                          appearance: CircularSliderAppearance(
                            animDurationMultiplier: 1,
                            size: 250,
                            customColors: CustomSliderColors(
                                shadowColor: Colors.black,
                                progressBarColor: kPrimaryColor,
                                trackColor: Colors.grey[200]),
                            customWidths: CustomSliderWidths(
                                progressBarWidth: 40,
                                trackWidth: 35,
                                handlerSize: 0,
                                shadowWidth: 40),
                          ),
                          max: BlocProvider.of<HomePageCubit>(context)
                                  .userWeight *
                              35,
                          initialValue:
                              BlocProvider.of<HomePageCubit>(context).c,
                        ),
                        SizedBox(
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            children: const [
                              CustomCard(
                                  numOfMl: "50 ml",
                                  imagePath:
                                      "assests/water_reminder_app_photo/50ml.png",
                                  mlValue: 50),
                              CustomCard(
                                  numOfMl: "100 ml",
                                  imagePath:
                                      "assests/water_reminder_app_photo/100ml.png",
                                  mlValue: 100),
                              CustomCard(
                                  numOfMl: "150 ml",
                                  imagePath:
                                      "assests/water_reminder_app_photo/150ml.png",
                                  mlValue: 150),
                              CustomCard(
                                  numOfMl: "250 ml",
                                  imagePath:
                                      "assests/water_reminder_app_photo/250ml.png",
                                  mlValue: 250),
                              CustomCard(
                                  numOfMl: "500 ml",
                                  imagePath:
                                      "assests/water_reminder_app_photo/500ml.png",
                                  mlValue: 500),
                              CustomCard(
                                  numOfMl: "1 L",
                                  imagePath:
                                      "assests/water_reminder_app_photo/1L.png",
                                  mlValue: 1000),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ));
      },
    );
  }
}


// Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 50.0),
//                       child: TextField(
//                         cursorColor: kPrimaryColor,
//                         maxLength: 3,
//                         decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 width: 3, color: kPrimaryColor), //<-- SEE HERE
//                           ),
//                         ),
//                         keyboardType: TextInputType.number,
//                       ),
//                     )



// Slider(
//                     label: "2.5L",
//                     autofocus: false,
//                     inactiveColor: Colors.grey[200],
//                     value: BlocProvider.of<HomePageCubit>(context).c,
//                     max:
//                         BlocProvider.of<HomePageCubit>(context).userWeight * 35,
//                     onChanged: (double value) {},
//                   ),