import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Seção 5: TECNOLOGIAS UTILIZADAS
/// Demonstra as ferramentas e tecnologias utilizadas na construção do próprio portfólio.
class TechSection extends StatelessWidget {
  const TechSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final isTablet = width >= 600 && width < 900;

    final technologies = [
      _TechItem(
        name: 'Flutter',
        description:
            'Framework utilizado para desenvolver a interface do portfólio.',
        icon: Icons.flutter_dash_rounded,
        color: const Color(0xFF02569B),
      ),
      _TechItem(
        name: 'Dart',
        description: 'Linguagem utilizada no desenvolvimento da aplicação.',
        icon: Icons.code_rounded,
        color: const Color(0xFF0175C2),
      ),
      _TechItem(
        name: 'Flutter Web',
        description:
            'Plataforma utilizada para executar o portfólio diretamente no navegador.',
        icon: Icons.language_rounded,
        color: const Color(0xFF027DFD),
      ),
      _TechItem(
        name: 'GitHub Pages',
        description:
            'Serviço utilizado posteriormente para publicar a aplicação Web.',
        icon: Icons.cloud_done_rounded,
        color: const Color(0xFF6E7681),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tecnologias Utilizadas',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.6,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Ferramentas que tornam este portfólio web uma realidade',
          style: TextStyle(
            color: AppTheme.textMuted,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 24),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: technologies.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 4),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 170,
          ),
          itemBuilder: (context, index) {
            final tech = technologies[index];
            return _TechCard(tech: tech);
          },
        ),
      ],
    );
  }
}

class _TechItem {
  final String name;
  final String description;
  final IconData icon;
  final Color color;

  _TechItem({
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
  });
}

class _TechCard extends StatelessWidget {
  final _TechItem tech;

  const _TechCard({required this.tech});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.surfaceBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: tech.color.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(tech.icon, color: tech.color, size: 22),
              ),
              const SizedBox(width: 12),
              Text(
                tech.name,
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Expanded(
            child: Text(
              tech.description,
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
