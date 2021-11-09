import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';

class Event {
  final String title;

  Event(this.title);

  @override
  String toString() => title;
}

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = {DateTime.utc(2021, 11, 5, 12, 5) : [Event("Workout")],
  DateTime.utc(2021, 11, 3, 12, 5) : [Event("Workout")],
  DateTime.utc(2021, 11, 1, 12, 5) : [Event("Workout")],
  DateTime.utc(2021, 11, 4, 12, 5) : [Event("Workout")],
  DateTime.utc(2021, 11, 10, 12, 5) : [Event("Workout")],
  DateTime.utc(2021, 11, 11, 12, 5) : [Event("Workout")],
  DateTime.utc(2021, 11, 14, 12, 5) : [Event("Workout")],
};

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
        (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);