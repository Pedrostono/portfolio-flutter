import 'package:flutter/material.dart';
import '../data/artwork_repository.dart';
import '../theme/app_theme.dart';
import 'artwork_image.dart';

/// Seção "OBRA EM DESTAQUE" - Grande card inicial com a ilustração em miniatura centralizada.
class HeroArtworkCard extends StatelessWidget {
  final VoidCallback onViewGallery;
  final VoidCallback onViewProject;

  const HeroArtworkCard({
    super.key,
    required this.onViewGallery,
    required this.onViewProject,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 850;
    final featured = ArtworkRepository.featuredArtwork;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppTheme.surfaceBorder, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryAccent.withValues(alpha: 0.08),
            blurRadius: 30,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: isMobile
            ? Column(
                children: [
                  _ArtworkPreview(featured: featured, height: 280),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: _ArtworkContent(
                      onViewGallery: onViewGallery,
                      onViewProject: onViewProject,
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: _ArtworkContent(
                        onViewGallery: onViewGallery,
                        onViewProject: onViewProject,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: _ArtworkPreview(featured: featured, height: 420),
                  ),
                ],
              ),
      ),
    );
  }
}

class _ArtworkContent extends StatelessWidget {
  final VoidCallback onViewGallery;
  final VoidCallback onViewProject;

  const _ArtworkContent({
    required this.onViewGallery,
    required this.onViewProject,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Tags e Data
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            _TagBadge(
              label: 'Ilustração',
              color: AppTheme.primaryAccent,
            ),
            _TagBadge(
              label: 'Arte Digital',
              color: AppTheme.secondaryAccent,
            ),
            _TagBadge(
              label: '2026',
              color: AppTheme.textMuted,
              isOutlined: true,
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Título
        const Text(
          'Galeria de Ilustrações',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.8,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 12),

        // Subtítulo
        const Text(
          'Uma seleção de desenhos e estudos que exploram personagens, formas, cores e diferentes estilos visuais.',
          style: TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 16,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 28),

        // Botões
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: onViewGallery,
              icon: const Icon(Icons.grid_view_rounded, size: 18),
              label: const Text('Ver Galeria'),
            ),
            OutlinedButton.icon(
              onPressed: onViewProject,
              icon: const Icon(Icons.palette_outlined, size: 18),
              label: const Text('Ver Projeto'),
            ),
          ],
        ),
      ],
    );
  }
}

class _TagBadge extends StatelessWidget {
  final String label;
  final Color color;
  final bool isOutlined;

  const _TagBadge({
    required this.label,
    required this.color,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isOutlined ? Colors.transparent : color.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isOutlined
              ? AppTheme.surfaceBorder
              : color.withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isOutlined ? AppTheme.textSecondary : color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _ArtworkPreview extends StatelessWidget {
  final dynamic featured;
  final double height;

  const _ArtworkPreview({
    required this.featured,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      color: AppTheme.surface,
      child: ArtworkImage(
        artwork: featured,
        borderRadius: 0,
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
    );
  }
}
