import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart'; // Import the package
import 'package:serialman/core/color/color.dart';
import 'package:serialman/core/shared_widget/custom_app_text.dart';
import 'package:serialman/feature/service_provider_deshboard/service_provider_widget/appointment_card/appointment_card.dart';
import 'package:serialman/feature/service_provider_deshboard/service_provider_widget/custom_action_button/custom_action_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //  Permission handler for camera permission
  Future<void> _handleCameraPermission() async {
    var status = await Permission.camera.request();
    if (!mounted) return;

    if (status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Camera permission granted. Starting call...'),
        ),
      );
    } else if (status.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Camera permission is required to make video calls.'),
        ),
      );
    } else if (status.isPermanentlyDenied) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Permission Required'),
          content: const Text(
            'Camera permission is permanently denied. Please go to your app settings to enable it.',
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Settings'),
              onPressed: () {
                openAppSettings();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor2.backgroundColor,
      body: Stack(
        children: [
          // This Container holds the gradient background
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1A4E8D), Color(0xFFA3C1C8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),

          // This ListView holds all the content and allows scrolling
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: [
              const SizedBox(height: 50),
              _buildHeader(),
              const SizedBox(height: 30),
              _buildQueueStatusCard(),
              const SizedBox(height: 24.0),
              _buildTodaysAppointments(),
              const SizedBox(height: 16.0),
              _buildActionButtons(),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  // Widget to display the action buttons
  Widget _buildActionButtons() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomActionButton(
                label: 'Call Next Patient',
                icon: Icons.call,
                backgroundColor: AppColor2.primaryColor,
                iconColor: Colors.white,
                textColor: Colors.white,
                onPressed: _handleCameraPermission,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: CustomActionButton(
                label: 'View Schedule',
                icon: Icons.calendar_month,
                backgroundColor: Colors.white,
                iconColor: AppColor2.arrivedStatusColor,
                textColor: AppColor2.textColorPrimary,
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomActionButton(
                label: 'Patient History',
                icon: Icons.history,
                backgroundColor: Colors.white,
                iconColor: Colors.redAccent,
                textColor: AppColor2.textColorPrimary,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Widget to display the header
  Widget _buildHeader() {
    return const Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=68'),
        ),
        SizedBox(height: 12.0),
        CustomAppText(
          text: 'Hello, Dr. Sharma!',
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ],
    );
  }

  // Widget to display the queue status card
  Widget _buildQueueStatusCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Color(0xFF1A4E8D), Color(0xFF48BFCE)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppText(
            text: 'Your Current Queue Status',
            color: Colors.white70,
            fontSize: 16,
          ),
          SizedBox(height: 8.0),
          CustomAppText(
            text: 'Next Patient: Priya Singh',
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomAppText(
                text: 'A17',
                color: Colors.white,
                fontSize: 56,
                fontWeight: FontWeight.bold,
              ),
              CustomAppText(
                text: 'Estimated Wait: 5 minutes',
                color: Colors.white,
                fontSize: 14,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget to display the list of appointments
  Widget _buildTodaysAppointments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppText(
          text: "Today's Appointments",
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 16.0),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 2.8,
          children: const [
            AppointmentCard(
              patientName: 'Amit Patel',
              specialization: 'Cardiology',
              avatarUrl: 'https://i.pravatar.cc/150?img=1',
              hasArrived: true,
            ),
            AppointmentCard(
              patientName: 'Dr. Khan',
              specialization: 'Pediatrics',
              avatarUrl: 'https://i.pravatar.cc/150?img=2',
              hasArrived: true,
            ),
            AppointmentCard(
              patientName: 'Sunita Devi',
              specialization: 'Cardiology',
              avatarUrl: 'https://i.pravatar.cc/150?img=3',
            ),
            AppointmentCard(
              patientName: 'Rohan Mehra',
              specialization: 'Dermatology',
              avatarUrl: 'https://i.pravatar.cc/150?img=4',
            ),
          ],
        ),
      ],
    );
  }
}
