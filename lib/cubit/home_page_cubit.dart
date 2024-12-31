import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());


  bool firstTime = true;
  
  double c = 0;
  int userWeight = 60;
  int day = DateTime.now().day;
  int month = DateTime.now().month;

  SharedPreferences? prefs;

  void initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs != null) {
      final currentDay = DateTime.now().day;
      final currentMonth = DateTime.now().month;

      final storedDay = prefs!.getInt('day');
      final storedMonth = prefs!.getInt('month');

      if (storedDay != null && storedMonth != null) {
        if (currentDay != storedDay || currentMonth != storedMonth) {
          c = 0;
          await prefs!.setDouble('c', c);
        } else {
          c = prefs!.getDouble('c') ?? c;
        }
      } else {
        c = 0;
        await prefs!.setDouble('c', c);
      }

      userWeight = prefs!.getInt('userWeight') ?? userWeight;
      firstTime = prefs!.getBool('firstTime') ?? firstTime;
      day = currentDay;
      month = currentMonth;
    } else {
      c = 0;
      userWeight = 60;
      firstTime = true;
      day = DateTime.now().day;
      month = DateTime.now().month;
    }
    emit(HomePageSetWeight());
  }

  void saveData() async {
    prefs ??= await SharedPreferences.getInstance();
    await prefs!.setInt('userWeight', userWeight);
    await prefs!.setDouble('c', c);
    await prefs!.setBool('firstTime', firstTime);

    await prefs!.setInt('day', DateTime.now().day);
    await prefs!.setInt('month', DateTime.now().month);

    emit(HomePageChangeValue());
  }

  void changeValue(double value) {
    if (c + value < userWeight * 35) {
      c = c + value;
    } else {
      c = userWeight * 35;
    }

    saveData();
    emit(HomePageChangeValue());
  }
}

/*
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  bool firstTime = true;
  double c = 0;
  int userWeight = 60;
  int day = DateTime.now().day;
  int month = DateTime.now().month;

  SharedPreferences? prefs;

  void initializeSharedPreferences() async {
    print("initializeSharedPreferences M");

    prefs = await SharedPreferences.getInstance();
    if (prefs != null) {
      if (day != DateTime.now().day) {
        print(("$day day"));
        print(("${DateTime.now().day} day now"));
        c = 0;
        await prefs!.setDouble('c', c);
      } else if (month != DateTime.now().month) {
        c = 0;
        await prefs!.setDouble('c', c);
      } else {
        c = prefs!.getDouble('c') ?? c;
      }
      userWeight = prefs!.getInt('userWeight') ?? userWeight;
      firstTime = prefs!.getBool('firstTime') ?? firstTime;
      day = prefs!.getInt('day') ?? day;
      month = prefs!.getInt('month') ?? month;
    } else {
      c = 0;
      userWeight = 60;
      firstTime = true;
      day = DateTime.now().day;
      month = DateTime.now().month;
    }
    emit(HomePageSetWeight());
  }

  void saveData() async {
    print("save date M");
    prefs ??= await SharedPreferences.getInstance();
    await prefs!.setInt('userWeight', userWeight);
    await prefs!.setDouble('c', c);
    await prefs!.setBool('firstTime', firstTime);

    await prefs!.setInt('day', day);
    await prefs!.setInt('month', month);

    emit(HomePageChangeValue());
  }

  void changeValue(double value) {
    if (c + value < userWeight * 35) {
      c = c + value;
    } else {
      c = userWeight * 35;
    }

    saveData();
    emit(HomePageChangeValue());
  }
}
*/