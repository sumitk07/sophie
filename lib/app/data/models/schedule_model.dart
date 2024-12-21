import 'dart:convert';

class Schedule {
  final String title;
  final DateTime appointmentDate;
  final String agenda;
  final int age;
  final String phoneNumber;
  final DateTime reminder;
  final String doctorName;
  final DateTime dateTime;

  final String initial;

  Schedule(
    this.title,
    this.appointmentDate,
    this.age,
    this.phoneNumber,
    this.reminder, {
    required this.doctorName,
    required this.dateTime,
    required this.agenda,
    required this.initial,
  });
}
