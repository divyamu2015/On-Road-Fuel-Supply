import 'package:cron/cron.dart';


Future<void> shedule() async {
  final cron = Cron();

  try {
    cron.schedule(Schedule.parse('*/6 * * * * *'), () {

    });

    await Future.delayed(Duration(seconds: 20));
    await cron.close();
  } on ScheduleParseException {
    // "ScheduleParseException" is thrown if cron parsing is failed.
    await cron.close();
  }
}