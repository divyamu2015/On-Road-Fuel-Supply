import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';

class AppMethods {
  checkOffLine() async {
    if (await DataConnectionChecker().connectionStatus ==
        DataConnectionStatus.connected) {
      return true;
    } else {
      return false;
    }
  }
}