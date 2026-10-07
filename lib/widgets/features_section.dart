import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Seção 6: CARACTERÍSTICAS PRINCIPAIS
/// Quatro cards destacando os principais diferenciais da aplicação.
class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 650;
    final isTablet = width >= 650 && width < 950;

    final features = [
      _FeatureItem(
        title: 'Galeria de Ilustrações',
        description:
            'Organização visual dos desenhos e trabalhos apresentados no portfólio.',
        icon: Icons.collections_bookmark_rounded,
        color: AppTheme.primaryAccent,
      ),
      _FeatureItem(
        title: 'Arte em Destaque',
        description:
            'Apresentação de uma ilustração principal com maior destaque visual.',
        icon: Icons.star_rounded,
        color: AppTheme.secondaryAccent,
      ),
      _FeatureItem(
        title: 'Interface Responsiva',
        description:
            'Adaptação do portfólio para diferentes tamanhos de tela.',
        icon: Icons.aspect_ratio_rounded,
        color: AppTheme.tertiaryAccent,
      ),
      _FeatureItem(
        title: 'Experiência Visual',
        description:
            'Uso de composição, tipografia, espaçamento e imagens para valorizar os trabalhos.',
        icon: Icons.auto_awesome_rounded,
        color: const Color(0xFFF59E0B),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Características Principais',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.6,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Destaques e diferenciais da aplicação desenvolvida',
          style: TextStyle(
            color: AppTheme.textMuted,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 24),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: features.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 4),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 185,
          ),
          itemBuilder: (context, index) {
            return _FeatureCard(feature: features[index]);
          },
        ),
      ],
    );
  }
}

class _FeatureItem {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  _FeatureItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}

class _FeatureCard extends StatelessWidget {
  final _FeatureItem feature;

  const _FeatureCard({required this.feature});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.surfaceBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: feature.color.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(feature.icon, color: feature.color, size: 24),
          ),
          const SizedBox(height: 16),
          Text(
            feature.title,
            style: const TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              feature.description,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 13,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
