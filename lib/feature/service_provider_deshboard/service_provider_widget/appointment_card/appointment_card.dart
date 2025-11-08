import 'package:flutter/material.dart';
import 'package:serialman/core/color/color.dart';
import 'package:serialman/core/shared_widget/custom_app_text.dart';

class AppointmentCard extends StatelessWidget {
  final String patientName;
  final String specialization;
  final String avatarUrl;
  final bool hasArrived;

  const AppointmentCard({
    Key? key,
    required this.patientName,
    required this.specialization,
    required this.avatarUrl,
    this.hasArrived = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: AppColor2.cardBackgroundColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl), // Placeholder, use your asset
            radius: 20,
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomAppText(
                  text: patientName,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                CustomAppText(
                  text: specialization,
                  color: AppColor2.textColorSecondary,
                  fontSize: 12,
                ),
              ],
            ),
          ),
          if (hasArrived)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: AppColor2.arrivedStatusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const CustomAppText(
                text: 'Arrived',
                color: AppColor2.arrivedStatusColor,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
}