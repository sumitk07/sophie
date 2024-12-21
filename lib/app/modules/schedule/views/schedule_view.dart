import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sophie/app/modules/schedule/views/upcoming_call.dart';
import 'package:sophie/app/routes/app_pages.dart';
import 'package:sophie/app/shared/theme.dart';
import 'package:sophie/app/widgets/custom_appbar.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({Key? key}) : super(key: key);

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  bool isUpcoming = true;

  void _navigateToDetails(
      BuildContext context, bool isUpcoming, Map<String, dynamic> appointment) {
    if (isUpcoming) {
      Get.toNamed(
        Routes.UPCOMING_CALL,
        arguments: {
          'title': 'Healthcare Consultant',
          'appointmentDate': DateTime(2024, 11, 11, 16, 0),
          'agenda':
              'Learn how to count carbs to help regulate insulin and medication dosages. Schedule regular check-ups with your healthcare provider to monitor your diabetes management.',
          'age': 56,
          'phoneNumber': '+91 59866+966',
          'reminder': DateTime(2024, 11, 24, 17, 0),
        },
      );
    } else {
      Get.toNamed(
        Routes.COMPLETED_CALL,
        arguments: appointment,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Sample data - you can replace this with your actual data source
    final List<Map<String, dynamic>> appointments = [
      {
        'initial': 'H',
        'title': 'Healthcare Consultant',
        'date': 'Nov 11, 2024',
        'time': '04:00 PM',
        'agenda':
            'Learn how to count carbs to help regulate insulin and medication dosages....',
      },
      {
        'initial': 'D',
        'title': 'Diabetes Consultation',
        'date': 'Nov 14, 2024',
        'time': '04:00 PM',
        'agenda':
            'Learn how to count carbs to help regulate insulin and medication dosages....',
      },
      {
        'initial': 'Q',
        'title': 'Quinn Slatter',
        'date': 'Nov 16, 2024',
        'time': '04:00 PM',
        'agenda':
            'Learn how to count carbs to help regulate insulin and medication dosages....',
      },
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Scheduled Calls',
        back: true,
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Segmented Button
              Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => isUpcoming = true),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color:
                                isUpcoming ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(15),
                            border: isUpcoming
                                ? Border.all(color: primary, width: 2)
                                : null,
                          ),
                          child: Center(
                            child: Text(
                              'Upcoming',
                              style: semibold.copyWith(
                                color: isUpcoming ? primary : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => isUpcoming = false),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color:
                                !isUpcoming ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border: !isUpcoming
                                ? Border.all(color: primary, width: 2)
                                : null,
                          ),
                          child: Center(
                            child: Text(
                              'Completed',
                              style: semibold.copyWith(
                                color: !isUpcoming ? primary : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Appointment Cards
              Expanded(
                child: ListView.separated(
                  itemCount: appointments.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final appointment = appointments[index];
                    return _AppointmentCard(
                      initial: appointment['initial'],
                      title: appointment['title'],
                      date: appointment['date'],
                      time: appointment['time'],
                      agenda: appointment['agenda'],
                      isHighlighted: index == 0,
                      onTap: () =>
                          _navigateToDetails(context, isUpcoming, appointment),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppointmentCard extends StatelessWidget {
  final String initial;
  final String title;
  final String date;
  final String time;
  final String agenda;
  final bool isHighlighted;
  final VoidCallback onTap;

  const _AppointmentCard({
    required this.initial,
    required this.title,
    required this.date,
    required this.time,
    required this.agenda,
    required this.onTap,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isHighlighted ? Colors.blue : Colors.grey[300]!,
            width: isHighlighted ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: primary,
                    child: Text(
                      initial,
                      style: semibold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: semibold.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 16,
                              color: primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              date,
                              style: TextStyle(),
                            ),
                            const SizedBox(width: 12),
                            const Icon(
                              Icons.access_time,
                              size: 16,
                              color: primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              time,
                              style: regular.copyWith(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                agenda,
                style: regular.copyWith(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Example Detail Pages
class UpcomingAppointmentDetails extends StatelessWidget {
  final String title;
  final DateTime appointmentDate;
  final String agenda;
  final int age;
  final String phoneNumber;
  final DateTime reminder;

  const UpcomingAppointmentDetails(
      {Key? key,
      required this.title,
      required this.appointmentDate,
      required this.agenda,
      required this.age,
      required this.phoneNumber,
      required this.reminder,
      required this.appointment})
      : super(key: key);

  final Map<String, dynamic> appointment;

  // const UpcomingAppointmentDetails({Key? key, required this.appointment})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header with title and datetime
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 4,
                )
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'H',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${appointmentDate.day}/${appointmentDate.month}/${appointmentDate.year}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Icon(
                            Icons.access_time,
                            size: 16,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${appointmentDate.hour.toString().padLeft(2, '0')}:${appointmentDate.minute.toString().padLeft(2, '0')} ${appointmentDate.hour >= 12 ? 'PM' : 'AM'}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Agenda Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 4,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Agenda',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  agenda,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Other Information Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 4,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Other Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                _buildInfoRow('Age of AI', '$age Years'),
                _buildInfoRow('Phone Number', phoneNumber),
                _buildInfoRow(
                  'Reminder',
                  '${reminder.day}/${reminder.month}/${reminder.year} ${reminder.hour.toString().padLeft(2, '0')}:${reminder.minute.toString().padLeft(2, '0')} ${reminder.hour >= 12 ? 'PM' : 'AM'}',
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Buttons
          Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[400],
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Edit Call',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.red[400]!),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Cancel Call',
                  style: TextStyle(
                    color: Colors.red[400],
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            '$label     :     ',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class CompletedAppointmentDetails extends StatelessWidget {
  final Map<String, dynamic> appointment;

  const CompletedAppointmentDetails({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed Appointment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${appointment['title']}'),
            Text('Date: ${appointment['date']}'),
            Text('Time: ${appointment['time']}'),
            Text('Agenda: ${appointment['agenda']}'),
            // Add more completed-specific details and actions here
          ],
        ),
      ),
    );
  }
}
