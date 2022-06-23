import 'package:shared_preferences/shared_preferences.dart';

String logState = "0";
String signState = "0";

setLog() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setInt(logState, 1);
}

setSign() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setInt(signState, 1);
}
