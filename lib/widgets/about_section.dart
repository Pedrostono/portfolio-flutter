import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Seção 9: SOBRE O ARTISTA
/// Apresentação pessoal e conceitual.
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 24 : 36),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppTheme.surfaceBorder, width: 1.5),
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _ArtistAvatarBadge(),
                SizedBox(height: 24),
                _AboutDetails(),
              ],
            )
          : Row(
              children: const [
                _ArtistAvatarBadge(),
                SizedBox(width: 36),
                Expanded(child: _AboutDetails()),
              ],
            ),
    );
  }
}

class _ArtistAvatarBadge extends StatelessWidget {
  const _ArtistAvatarBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppTheme.primaryGradient,
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryAccent.withValues(alpha: 0.3),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 130,
          height: 130,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.surface,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.palette_outlined,
                size: 40,
                color: AppTheme.primaryAccent,
              ),
              SizedBox(height: 6),
              Text(
                'Pedro',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AboutDetails extends StatelessWidget {
  const _AboutDetails();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sobre Mim',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.6,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Sou Pedro, estudante e desenvolvedor interessado em tecnologia e artes visuais. Este portfólio reúne alguns dos meus trabalhos e estudos de ilustração.',
          style: TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 16,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: const [
            _SkillChip(label: 'Ilustração Digital'),
            _SkillChip(label: 'Desenho & Esboços'),
            _SkillChip(label: 'Estudo de Cores'),
            _SkillChip(label: 'Flutter & Web'),
          ],
        ),
      ],
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.surfaceBorder),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppTheme.textPrimary,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
