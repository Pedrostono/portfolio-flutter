import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Seção 4: O DESAFIO E A SOLUÇÃO
/// Apresenta o objetivo do portfólio e a abordagem utilizada para resolvê-lo.
class ChallengeSolutionSection extends StatelessWidget {
  const ChallengeSolutionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle(
            title: 'O Desafio & A Solução',
            subtitle: 'Propósito do projeto e conceito adotado no desenvolvimento',
          ),
          const SizedBox(height: 24),
          isMobile
              ? const Column(
                  children: [
                    _ChallengeCard(),
                    SizedBox(height: 16),
                    _SolutionCard(),
                  ],
                )
              : const Row(
                  children: [
                    Expanded(child: _ChallengeCard()),
                    SizedBox(width: 20),
                    Expanded(child: _SolutionCard()),
                  ],
                ),
        ],
      ),
    );
  }
}

class _ChallengeCard extends StatelessWidget {
  const _ChallengeCard();

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
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.secondaryAccent.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.draw_outlined,
              color: AppTheme.secondaryAccent,
              size: 26,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'O Desafio',
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Reunir diferentes trabalhos artísticos em um espaço que permita apresentar cada ilustração de maneira visual e organizada.',
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

class _SolutionCard extends StatelessWidget {
  const _SolutionCard();

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
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.primaryAccent.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.devices_outlined,
              color: AppTheme.primaryAccent,
              size: 26,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'A Solução',
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Desenvolver um portfólio web responsivo em Flutter, criando uma experiência visual para apresentar desenhos, projetos e informações sobre o processo criativo.',
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

class _SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionTitle({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.6,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: const TextStyle(
            color: AppTheme.textMuted,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
