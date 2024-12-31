import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:water_reminder_app/const.dart';
import 'package:water_reminder_app/cubit/home_page_cubit.dart';
import 'package:water_reminder_app/pages/home_page.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text("Edit your weight")),

      content: StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) {
          return SizedBox(
            height: 210,
            child: Column(
              children: [
                NumberPicker(
                  minValue: 10,
                  maxValue: 250,
                  value: BlocProvider.of<HomePageCubit>(context).userWeight,
                  onChanged: (value) async {
                    BlocProvider.of<HomePageCubit>(context).c = 0;
                    BlocProvider.of<HomePageCubit>(context).userWeight = value;

                    setState(
                      () {},
                    );
                  },
                  selectedTextStyle: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 23,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 120,
                  child: FloatingActionButton.extended(
                    backgroundColor: kPrimaryColor,
                    onPressed: () {
                      BlocProvider.of<HomePageCubit>(context).saveData();
                      Navigator.pop(context);
                    },
                    label: const Text("submit"),
                  ),
                )
              ],
            ),
          );
        },
      ),
      // actions: [
      //   Center(
      //       child: FloatingActionButton(onPressed: () {}))
      // ],
    );
  }
}

class CustomAlertDialogForFirstRun extends StatelessWidget {
  const CustomAlertDialogForFirstRun({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text("Enter your weight")),
      content: StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) {
          return SizedBox(
            height: 210,
            child: Column(
              children: [
                NumberPicker(
                  minValue: 10,
                  maxValue: 250,
                  value: BlocProvider.of<HomePageCubit>(context).userWeight,
                  onChanged: (value) async {
                    BlocProvider.of<HomePageCubit>(context).c = 0;
                    BlocProvider.of<HomePageCubit>(context).userWeight = value;

                    setState(
                      () {},
                    );
                  },
                  selectedTextStyle: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 23,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 120,
                  child: FloatingActionButton.extended(
                    backgroundColor: kPrimaryColor,
                    onPressed: () {
                      BlocProvider.of<HomePageCubit>(context).firstTime = false;
                      BlocProvider.of<HomePageCubit>(context).saveData();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    label: const Text("submit"),
                  ),
                )
              ],
            ),
          );
        },
      ),
      // actions: [
      //   Center(
      //       child: FloatingActionButton(onPressed: () {}))
      // ],
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.numOfMl,
      required this.mlValue,
      required this.imagePath});
  final String numOfMl;
  final String imagePath;
  final double mlValue;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<HomePageCubit>(context).changeValue(mlValue);
        },
        child: Card(
          margin: const EdgeInsets.all(5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  width: 45,
                  height: 45,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  numOfMl,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Colors.grey[700]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
