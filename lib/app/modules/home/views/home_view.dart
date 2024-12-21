import 'package:flutter/material.dart';
import 'package:sophie/app/shared/spacing.dart';
import 'package:sophie/app/shared/theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _CustomAppBar(),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats Row
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    color: const Color(0xFFFFB74D),
                    icon: Icons.call,
                    number: "64",
                    label: "Completed Calls",
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  child: _StatCard(
                    color: const Color(0xFF7265E3),
                    icon: Icons.calendar_today,
                    number: "12",
                    label: "Scheduled Calls",
                  ),
                ),
              ],
            ),

            // Upcoming Call Section
            verticalSpace(24),
            _SectionHeader(title: "Upcoming Call", hasViewAll: true),
            verticalSpace(12),
            _UpcomingCallCard(
              title: "Healthcare Consultant",
              date: "Nov 11, 2024",
              time: "04:00 PM",
              agenda:
                  "Learn how to count carbs to help regulate insulin and medication dosages....",
            ),

            // Scheduled Calls Section
            verticalSpace(24),
            _SectionHeader(title: "Scheduled Calls", hasViewAll: true),
            verticalSpace(12),
            _CallListItem(
              title: "Healthcare Consultant",
              date: "Nov 11, 2024",
              time: "04:00 PM",
            ),

            // Completed Calls Section
            verticalSpace(24),
            _SectionHeader(title: "Completed Calls", hasViewAll: true),
            verticalSpace(12),
            _CallListItem(
              title: "Healthcare Consultant",
              date: "Nov 11, 2024",
              time: "04:00 PM",
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String number;
  final String label;

  const _StatCard({
    required this.color,
    required this.icon,
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: white, size: 24),
          verticalSpace(8),
          Text(
            number,
            style: const TextStyle(
              color: white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              color: white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final bool hasViewAll;

  const _SectionHeader({
    required this.title,
    this.hasViewAll = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: regular.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (hasViewAll)
          TextButton(
            onPressed: () {},
            child: Text(
              "See All",
              style: regular.copyWith(
                color: primary,
              ),
            ),
          ),
      ],
    );
  }
}

class _UpcomingCallCard extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String agenda;

  const _UpcomingCallCard({
    required this.title,
    required this.date,
    required this.time,
    required this.agenda,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: white.withOpacity(0.2),
                child: const Text(
                  'H',
                  style: TextStyle(color: white),
                ),
              ),
              horizontalSpace(12),
              Text(
                title,
                style: medium.copyWith(
                  color: white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          verticalSpace(12),
          Row(
            children: [
              const Icon(Icons.calendar_today, color: white, size: 16),
              horizontalSpace(8),
              Text(
                date,
                style: regular.copyWith(color: white),
              ),
              horizontalSpace(16),
              const Icon(Icons.access_time, color: white, size: 16),
              horizontalSpace(8),
              Text(
                time,
                style: regular.copyWith(color: white),
              ),
            ],
          ),
          verticalSpace(12),
          Text(
            "Agenda: $agenda",
            style: regular.copyWith(color: white),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _CallListItem extends StatelessWidget {
  final String title;
  final String date;
  final String time;

  const _CallListItem({
    required this.title,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: primary,
            child: const Text(
              'H',
              style: TextStyle(color: white),
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: regular.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.calendar_today,
                        size: 14, color: Colors.grey),
                    horizontalSpace(4),
                    Text(
                      date,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    horizontalSpace(16),
                    const Icon(Icons.access_time, size: 14, color: Colors.grey),
                    horizontalSpace(4),
                    Text(
                      time,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      toolbarHeight: 60,
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: const NetworkImage(
              'https://via.placeholder.com/40', // Replace with actual image URL
            ),
          ),
          horizontalSpace(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello',
                style: regular.copyWith(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Frank Thomsan',
                    style: medium.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
