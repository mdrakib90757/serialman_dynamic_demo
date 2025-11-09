import 'package:flutter/material.dart';
import 'package:serialman/core/color/color.dart';
import 'package:serialman/core/shared_widget/custom_app_text.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1A4E8D), Color(0xFF48BFCE)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Your Real-Time Queue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Scrollable Content
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const SizedBox(height: 100),
              _buildQueueStatusCard(),
              const SizedBox(height: 24),
              _buildTodaysAppointmentsSection(),
              const SizedBox(height: 16),
              _buildMapView(),
            ],
          ),
        ],
      ),
    );
  }

  //  Queue Status Card
  Widget _buildQueueStatusCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF48BFCE), Color(0xFF1A4E8D)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppText(
            text: 'Your Current Queue Status',
            color: Colors.white,
            fontSize: 16,
          ),
          const SizedBox(height: 8),
          const CustomAppText(
            text: 'Your Serial:',
            color: Colors.white70,
            fontSize: 14,
          ),
          const CustomAppText(
            text: 'A17',
            color: Colors.white,
            fontSize: 56,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 4),
          const CustomAppText(
            text: 'Estimated Wait: 15 minutes',
            color: Colors.white,
            fontSize: 14,
          ),
          const SizedBox(height: 16),

          // Progress Bar
          Row(
            children: [
              const Expanded(
                child: LinearProgressIndicator(
                  value: 0.7,
                  backgroundColor: Colors.white30,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  minHeight: 6,
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColor2.primaryColor.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.timer_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Appointments Section
  Widget _buildTodaysAppointmentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0, bottom: 16.0),
          child: CustomAppText(
            text: "Today's Appointments",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        _buildAppointmentTile(
          title: 'Now Serving:',
          subtitle: 'Mr. Kumar',
          iconData: Icons.check_circle,
          iconColor: AppColor.success,
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 12),
        _buildAppointmentTile(
          title: 'Your Turn Next: A16 - A17 - Priya Singh',
          subtitle: 'Arrived',
          avatarUrl: 'https://i.pravatar.cc/150?img=5',
          isHighlighted: true,
        ),
        const SizedBox(height: 12),
        _buildAppointmentTile(
          title: 'Coming Up',
          subtitle: 'A18 - S. Chen',
          iconData: Icons.person_outline,
          iconColor: Colors.grey,
          trailing: const Icon(Icons.history, size: 20, color: Colors.grey),
        ),
      ],
    );
  }

  // Appointment Tile
  Widget _buildAppointmentTile({
    required String title,
    required String subtitle,
    IconData? iconData,
    Color? iconColor,
    String? avatarUrl,
    Widget? trailing,
    bool isHighlighted = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: isHighlighted
            ? Border.all(color: AppColor2.primaryColor, width: 1.5)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar or Icon
          if (avatarUrl != null)
            CircleAvatar(radius: 20, backgroundImage: NetworkImage(avatarUrl))
          else if (iconData != null)
            CircleAvatar(
              radius: 20,
              backgroundColor: iconColor?.withOpacity(0.1),
              child: Icon(iconData, color: iconColor, size: 20),
            ),
          const SizedBox(width: 16),
          // Title and Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppText(
                  text: title,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 4),
                CustomAppText(
                  text: subtitle,
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ],
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  // build google map view
  Widget _buildMapView() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/image/images (1).jpeg',
        fit: BoxFit.cover,
        height: 150,
        width: double.infinity,
      ),
    );
  }
}
