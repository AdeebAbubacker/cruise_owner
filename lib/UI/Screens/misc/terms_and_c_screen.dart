import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 255, 248),
      appBar: AppBar(
        elevation: 5,
        backgroundColor: const Color.fromARGB(255, 252, 255, 248),
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          "Terms & Conditions",
          style: GoogleFonts.ubuntu(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(title: "Welcome to Cruise Buddy (Admin)"),
              PrivacyPoints(
                text:
                    "By accessing or using the Cruise Buddy admin panel, you agree to be bound by these Terms and Conditions, applicable to platform administrators.",
              ),
              SectionHeader(title: "1. Account Management"),
              PrivacyPoints(
                text:
                    "As an admin, you are responsible for managing user accounts, overseeing content, and ensuring the platform's security.",
              ),
              PrivacyPoints(
                text:
                    "You must keep your login credentials confidential. Any unauthorized access to the admin panel must be reported immediately.",
              ),
              SectionHeader(title: "2. Platform Usage and Responsibilities"),
              PrivacyPoints(
                text:
                    "Admins are expected to ensure the platform runs smoothly by monitoring user activity, ensuring compliance with legal guidelines, and managing content as required.",
              ),
              PrivacyPoints(
                text:
                    "You must act responsibly when dealing with sensitive data and comply with all applicable privacy laws and regulations.",
              ),
              SectionHeader(title: "3. Payment and Financial Management"),
              PrivacyPoints(
                text:
                    "Admins are responsible for overseeing financial transactions, including processing payments, refunds, and chargebacks.",
              ),
              PrivacyPoints(
                text:
                    "All payment data is handled securely through trusted payment gateways, and any discrepancies should be reported immediately to support.",
              ),
              SectionHeader(title: "4. Data Security and Privacy"),
              PrivacyPoints(
                text:
                    "As an admin, you are responsible for ensuring that all user data is handled securely. This includes compliance with data protection regulations like GDPR.",
              ),
              PrivacyPoints(
                text:
                    "Any breach of data security or misuse of personal data should be reported and addressed immediately.",
              ),
              SectionHeader(title: "5. Liability and Indemnity"),
              PrivacyPoints(
                text:
                    "Cruise Buddy is not liable for any loss, damages, or liabilities arising from your actions or decisions as an admin.",
              ),
              PrivacyPoints(
                text:
                    "You agree to indemnify Cruise Buddy against any claims, liabilities, or damages resulting from your failure to adhere to these terms.",
              ),
              SectionHeader(title: "6. Platform Modifications"),
              PrivacyPoints(
                text:
                    "Cruise Buddy reserves the right to modify, update, or discontinue features and functionalities of the platform without prior notice.",
              ),
              PrivacyPoints(
                text:
                    "Admins will be notified of significant changes to the platform's terms, privacy policies, or core functionalities.",
              ),
              SectionHeader(title: "7. Termination of Admin Access"),
              PrivacyPoints(
                text:
                    "Cruise Buddy reserves the right to revoke admin access at any time for violation of these terms or other misconduct.",
              ),
              PrivacyPoints(
                text:
                    "In case of termination, the admin's access to the platform will be suspended immediately, and all associated data will be securely handled.",
              ),
              SectionHeader(title: "8. Changes to Terms and Conditions"),
              PrivacyPoints(
                text:
                    "Cruise Buddy may update these Terms and Conditions at any time. Continued use of the admin panel constitutes agreement to the updated terms.",
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoTile({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyles.ubuntu16black23wBold,
        ),
        trailing: SvgPicture.asset('assets/image/profile/arrow_right.svg'),
        onTap: () {
          // Optional: Navigate to detailed page or show modal
        },
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
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

class PrivacyPoints extends StatelessWidget {
  final String text;
  const PrivacyPoints({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 9.0),
            child: CircleAvatar(
              radius: 2.5,
              backgroundColor: Colors.black,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
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
