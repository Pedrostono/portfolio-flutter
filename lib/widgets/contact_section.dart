import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_constants.dart';
import '../theme/app_theme.dart';

/// Seção 10: CONTATO / CALL TO ACTION
/// Chamada para ação final com links de redes sociais e e-mail.
class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchURL(BuildContext context, String urlString) async {
    final Uri uri = Uri.parse(urlString);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (context.mounted) {
          _showSnackBar(context, 'Link configurado: $urlString');
        }
      }
    } catch (e) {
      if (context.mounted) {
        _showSnackBar(context, 'Link configurado: $urlString');
      }
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.surface,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 650;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: isMobile ? 36 : 52,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E1B4B), Color(0xFF18182B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: AppTheme.primaryAccent.withValues(alpha: 0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryAccent.withValues(alpha: 0.12),
            blurRadius: 30,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.primaryAccent.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.alternate_email_rounded,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(height: 20),

          // Título
          const Text(
            'Vamos conversar?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.8,
            ),
          ),
          const SizedBox(height: 10),

          // Subtítulo
          const Text(
            'Gostou de algum trabalho? Entre em contato ou acompanhe meus projetos.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),

          // Botões de Contato
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: [
              _SocialButton(
                label: 'Instagram',
                icon: Icons.camera_alt_outlined,
                color: const Color(0xFFE1306C),
                onPressed: () => _launchURL(context, AppConstants.instagramUrl),
              ),
              _SocialButton(
                label: 'GitHub',
                icon: Icons.code_rounded,
                color: const Color(0xFF333333),
                onPressed: () => _launchURL(context, AppConstants.githubUrl),
              ),
              _SocialButton(
                label: 'E-mail',
                icon: Icons.mail_outline_rounded,
                color: AppTheme.primaryAccent,
                onPressed: () => _launchURL(context, AppConstants.emailUrl),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.surface,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppTheme.surfaceBorder, width: 1.5),
        ),
      ),
    );
  }
}
