import 'package:flutter/material.dart';
import '../data/artwork_repository.dart';
import '../theme/app_theme.dart';
import 'artwork_dialog.dart';
import 'artwork_image.dart';

/// Seção 3: ÁREA VISUAL PRINCIPAL
/// Exibe a ilustração em destaque em um quadro amplo.
/// Ao clicar, abre o modal exibindo a imagem inteira sem cortes.
class VisualShowcase extends StatelessWidget {
  const VisualShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 650;
    final featured = ArtworkRepository.featuredArtwork;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 20 : 32),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppTheme.surfaceBorder, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabeçalho da área visual
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryAccent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Ilustração em Destaque',
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () => ArtworkDialog.show(context, featured),
                icon: const Icon(Icons.fullscreen_rounded,
                    color: AppTheme.primaryAccent),
                tooltip: 'Ampliar Obra (Imagem Completa)',
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Moldura em miniatura - Preenche o espaço e centraliza a imagem
          InkWell(
            onTap: () => ArtworkDialog.show(context, featured),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: double.infinity,
              height: isMobile ? 320 : 480,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppTheme.surfaceBorder,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.4),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ArtworkImage(
                artwork: featured,
                borderRadius: 20,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Rodapé informativo da ilustração
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      featured.title,
                      style: const TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${featured.technique} • ${featured.year}',
                      style: const TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton.icon(
                onPressed: () => ArtworkDialog.show(context, featured),
                icon: const Icon(Icons.info_outline_rounded, size: 16),
                label: const Text('Ver Completa'),
                style: TextButton.styleFrom(
                  foregroundColor: AppTheme.primaryAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
