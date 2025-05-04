import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 255, 248),
      appBar: AppBar(
        elevation: 5,
        backgroundColor: const Color.fromARGB(255, 252, 255, 248),
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          "Owner's Privacy Policy",
          style: GoogleFonts.ubuntu(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SectionHeader(title: "Introduction"),
            PrivacyPoint(
                number: 1,
                text:
                    "As the owner of the CruiseBuddy platform, we value the privacy and security of our data, and this policy explains how we manage it."),
            PrivacyPoint(
                number: 2,
                text:
                    "By using this admin interface, you agree to the practices outlined in this privacy policy."),

            SectionHeader(title: "Data Collection"),
            PrivacyPoint(
                number: 3,
                text:
                    "We collect business-related information such as user activity, sales data, and usage analytics for platform performance."),
            PrivacyPoint(
                number: 4,
                text:
                    "We may collect data from service providers, including transaction records and server logs."),
            PrivacyPoint(
                number: 5,
                text:
                    "Location and usage data from users are tracked for analytics purposes to improve app functionality."),

            SectionHeader(title: "Use of Data"),
            PrivacyPoint(
                number: 6,
                text:
                    "We use collected data to optimize platform performance, user engagement, and app feature development."),
            PrivacyPoint(
                number: 7,
                text:
                    "Data is also used for business intelligence, including tracking user behavior, marketing campaigns, and support."),
            PrivacyPoint(
                number: 8,
                text:
                    "No personal user data is sold to third parties, and we ensure data privacy in compliance with applicable laws."),

            SectionHeader(title: "Data Sharing"),
            PrivacyPoint(
                number: 9,
                text:
                    "We may share data with partners or service providers to assist with functionality or to comply with legal requirements."),
            PrivacyPoint(
                number: 10,
                text:
                    "User data may be disclosed to government agencies or law enforcement if legally required."),

            SectionHeader(title: "Security"),
            PrivacyPoint(
                number: 11,
                text:
                    "We employ state-of-the-art encryption and secure storage methods to protect all collected data."),
            PrivacyPoint(
                number: 12,
                text:
                    "Access to sensitive data is strictly controlled and only available to authorized personnel within the organization."),

            SectionHeader(title: "Admin Rights and Responsibilities"),
            PrivacyPoint(
                number: 13,
                text:
                    "As an admin, you can manage user accounts, access analytics, and control settings within the app."),
            PrivacyPoint(
                number: 14,
                text:
                    "It is your responsibility to ensure that user data is managed securely and in compliance with legal requirements."),

            SectionHeader(title: "Cookies and Tracking"),
            PrivacyPoint(
                number: 15,
                text:
                    "We may use cookies or similar technologies for website analytics and user behavior tracking in the admin panel."),
            PrivacyPoint(
                number: 16,
                text:
                    "You can manage cookie preferences through the admin dashboard or within your browser settings."),

            SectionHeader(title: "Policy Updates"),
            PrivacyPoint(
                number: 17,
                text:
                    "This privacy policy may be updated periodically to reflect changes in our business practices or legal requirements."),
            PrivacyPoint(
                number: 18,
                text:
                    "Significant changes will be communicated via email or notifications in the admin dashboard."),

            SectionHeader(title: "Contact Information"),
            PrivacyPoint(
                number: 19,
                text:
                    "For questions or concerns regarding this policy, please contact us at admin.cruisebuddy@company.com."),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 6.0),
      child: Text(
        title,
        style: GoogleFonts.ubuntu(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class PrivacyPoint extends StatelessWidget {
  final int number;
  final String text;
  const PrivacyPoint({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$number. ",
            style: GoogleFonts.ubuntu(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: GoogleFonts.ubuntu(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
