import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_01/services/contact_api_service.dart';
import 'package:portfolio_01/utils/app_colors.dart';
import 'package:portfolio_01/utils/responsive.dart';
import 'package:portfolio_01/widgets/custom_button.dart';
import 'package:portfolio_01/widgets/navbar.dart';
import 'package:portfolio_01/widgets/section_title.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

 Future<void> _sendMessage() async {
  if (!_formKey.currentState!.validate()) {
    return;
  }

  final name = _nameController.text.trim();
  final email = _emailController.text.trim();
  final subject = _subjectController.text.trim();
  final message = _messageController.text.trim();

  final success = await ContactApiService.sendMessage(
    name: name,
    email: email,
    subject: subject,
    message: message,
  );

  if (!mounted) return;

  if (success) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.check_circle_rounded,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Thank you $name! Your message has been sent.',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    _formKey.currentState!.reset();
    _nameController.clear();
    _emailController.clear();
    _subjectController.clear();
    _messageController.clear();
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Failed to send message. Please try again.',
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

  void _copyToClipboard(String text, String label) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label copied to clipboard!'),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double padding = Responsive.horizontalPadding(context);
    final bool isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(activeRoute: 'Contact'),

            const SizedBox(height: 40),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Column(
                  children: [
                    const SectionTitle(
                      badge: 'Get In Touch',
                      title: 'Let\'s Connect & Collaborate',
                      subtitle:
                          'Have an opportunity, project idea, or just want to talk about Flutter and Spring Boot? Reach out anytime!',
                    ),

                    const SizedBox(height: 48),

                    isMobile
                        ? Column(
                            children: [
                              _buildContactInfoCard(),
                              const SizedBox(height: 32),
                              _buildMessageFormCard(),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 5, child: _buildContactInfoCard()),
                              const SizedBox(width: 32),
                              Expanded(flex: 6, child: _buildMessageFormCard()),
                            ],
                          ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 80),

            // Footer
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: const Center(
                child: Text(
                  '© 2026 Jayaprakash H • Built with Flutter',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // CONTACT INFORMATION CARD
  // ------------------------------------------------------------

  Widget _buildContactInfoCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderBlue),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Contact Information',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Feel free to connect directly via email, phone, or professional networks.',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 28),

          _buildContactTile(
            icon: Icons.email_rounded,
            title: 'Email Address',
            value: 'jayaprakashh2005@gmail.com',
            onTap: () => _copyToClipboard(
              'jayaprakashh2005@gmail.com',
              'Email address',
            ),
            trailingTooltip: 'Copy Email',
          ),

          const SizedBox(height: 16),

          _buildContactTile(
            icon: Icons.phone_rounded,
            title: 'Phone / WhatsApp',
            value: '+91 9176437728',
            onTap: () => _copyToClipboard(
              '+91 9176437728',
              'Phone number',
            ),
            trailingTooltip: 'Copy Phone',
          ),

          const SizedBox(height: 16),

          _buildContactTile(
            icon: Icons.location_on_rounded,
            title: 'Location',
            value: 'Chennai, India (Available for Remote / Relocation)',
            onTap: null,
          ),

          const SizedBox(height: 28),
          const Divider(color: AppColors.border),
          const SizedBox(height: 20),

          const Text(
            'Professional Profiles',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 14),

          Wrap(
            spacing: 12,
            runSpacing: 10,
            children: [
              _buildSocialChip(
                icon: Icons.code_rounded,
                label: 'GitHub',
                onTap: () {
                  _copyToClipboard('https://github.com/JAYAPRAKASH-H31', 'GitHub URL');
                },
              ),
              _buildSocialChip(
                icon: Icons.work_rounded,
                label: 'LinkedIn',
                onTap: () {
                  _copyToClipboard('www.linkedin.com/in/jayaprakash-h-31-coder', 'LinkedIn URL');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactTile({
    required IconData icon,
    required String title,
    required String value,
    VoidCallback? onTap,
    String? trailingTooltip,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.backgroundAlt,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.borderBlue.withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          if (onTap != null)
            IconButton(
              icon: const Icon(Icons.copy_rounded, size: 18, color: AppColors.primary),
              tooltip: trailingTooltip,
              onPressed: onTap,
            ),
        ],
      ),
    );
  }

  Widget _buildSocialChip({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.accentSoft,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderBlue),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: AppColors.primary),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryDark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // INTERACTIVE MESSAGE FORM
  // ------------------------------------------------------------

  Widget _buildMessageFormCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderBlue),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(28),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Send a Message',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Leave your message below and I will get back to you promptly.',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 24),

            // Name Field
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Your Name *',
                hintText: 'Enter your full name',
                prefixIcon: Icon(Icons.person_outline_rounded, color: AppColors.primary),
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Email Field
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Your Email *',
                hintText: 'name@example.com',
                prefixIcon: Icon(Icons.mail_outline_rounded, color: AppColors.primary),
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return 'Please enter your email';
                }
                if (!val.contains('@') || !val.contains('.')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Subject Field
            TextFormField(
              controller: _subjectController,
              decoration: const InputDecoration(
                labelText: 'Subject',
                hintText: 'Project inquiry, recruitment, etc.',
                prefixIcon: Icon(Icons.subject_rounded, color: AppColors.primary),
              ),
            ),

            const SizedBox(height: 16),

            // Message Field
            TextFormField(
              controller: _messageController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Message *',
                hintText: 'Write your message here...',
                alignLabelWithHint: true,
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return 'Please enter a message';
                }
                return null;
              },
            ),

            const SizedBox(height: 24),

            // Submit Button
            PrimaryButton(
              text: 'Send Message',
              icon: Icons.send_rounded,
              isFullWidth: true,
              onPressed: _sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}