import 'package:flutter/material.dart';
import '../data/artwork_model.dart';
import '../theme/app_theme.dart';
import 'artwork_image.dart';

/// Modal para exibição detalhada da obra.
/// Exibe a imagem COMPLETA e inteira (sem cortar) usando BoxFit.contain.
class ArtworkDialog extends StatelessWidget {
  final Artwork artwork;

  const ArtworkDialog({super.key, required this.artwork});

  static void show(BuildContext context, Artwork artwork) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => ArtworkDialog(artwork: artwork),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 600;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 36,
        vertical: isMobile ? 16 : 32,
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 950,
          maxHeight: screenSize.height * 0.92,
        ),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppTheme.surfaceBorder, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.65),
              blurRadius: 35,
              spreadRadius: 5,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header do Dialog com botão Fechar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: artwork.primaryColor.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: artwork.primaryColor.withValues(alpha: 0.4)),
                          ),
                          child: Text(
                            artwork.category,
                            style: TextStyle(
                              color: artwork.primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          artwork.year,
                          style: const TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white70),
                      onPressed: () => Navigator.of(context).pop(),
                      hoverColor: Colors.white10,
                    ),
                  ],
                ),
              ),
              const Divider(height: 1, color: AppTheme.surfaceBorder),

              // Conteúdo principal rolável
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Imagem COMPLETA da Obra - Exibida 100% inteira sem cortes
                      Center(
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            maxHeight: screenSize.height * 0.58,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.cardBg,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppTheme.surfaceBorder,
                              width: 1,
                            ),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: ArtworkImage(
                            artwork: artwork,
                            borderRadius: 12,
                            fit: BoxFit.contain, // Imagem completa sem nenhum corte
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Título
                      Text(
                        artwork.title,
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              fontSize: isMobile ? 24 : 32,
                            ),
                      ),
                      const SizedBox(height: 12),

                      // Descrição
                      Text(
                        artwork.description,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 20),

                      // Detalhes técnicos
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppTheme.cardBg,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppTheme.surfaceBorder),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.brush_outlined,
                              color: artwork.primaryColor,
                              size: 22,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Técnica / Estilo',
                                    style: TextStyle(
                                      color: AppTheme.textMuted,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    artwork.technique,
                                    style: const TextStyle(
                                      color: AppTheme.textPrimary,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
