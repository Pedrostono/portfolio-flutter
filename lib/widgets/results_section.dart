import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Seção 8: RESULTADOS E LIÇÕES APRENDIDAS
/// Apresenta o resultado alcançado e os aprendizados do desenvolvimento do projeto.
class ResultsSection extends StatelessWidget {
  const ResultsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Resultados & Lições Aprendidas',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.6,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Síntese das conquistas e conhecimentos adquiridos no projeto',
          style: TextStyle(
            color: AppTheme.textMuted,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 24),
        isMobile
            ? const Column(
                children: [
                  _ResultCard(),
                  SizedBox(height: 16),
                  _LearningCard(),
                ],
              )
            : const Row(
                children: [
                  Expanded(child: _ResultCard()),
                  SizedBox(width: 20),
                  Expanded(child: _LearningCard()),
                ],
              ),
      ],
    );
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        borderRadius: BorderRadius.circular(22),
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
                  color: AppTheme.primaryAccent.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.verified_rounded,
                  color: AppTheme.primaryAccent,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              const Text(
                'Resultado',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Criação de um portfólio artístico responsivo utilizando Flutter Web, reunindo trabalhos visuais em uma interface única.',
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 15,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

class _LearningCard extends StatelessWidget {
  const _LearningCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        borderRadius: BorderRadius.circular(22),
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
                  color: AppTheme.tertiaryAccent.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.psychology_rounded,
                  color: AppTheme.tertiaryAccent,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              const Text(
                'Aprendizado',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Prática no desenvolvimento de interfaces com Flutter, organização de widgets, responsividade e publicação de uma aplicação Web.',
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 15,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
