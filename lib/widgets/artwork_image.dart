import 'package:flutter/material.dart';
import '../data/artwork_model.dart';
import '../theme/app_theme.dart';

/// Widget inteligente para exibição de ilustrações.
/// Na miniatura, preenche o container com imagem centralizada (BoxFit.cover + Alignment.center).
/// Ao ser ampliada no modal, exibe a imagem completa sem cortes (BoxFit.contain).
class ArtworkImage extends StatelessWidget {
  final Artwork artwork;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final double borderRadius;

  const ArtworkImage({
    super.key,
    required this.artwork,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.borderRadius = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        artwork.imagePath,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        errorBuilder: (context, error, stackTrace) {
          // Fallback visualmente bonito quando o arquivo do asset não existir localmente ainda
          return _ArtPlaceholderCanvas(
            artwork: artwork,
            width: width,
            height: height,
          );
        },
      ),
    );
  }
}

class _ArtPlaceholderCanvas extends StatelessWidget {
  final Artwork artwork;
  final double? width;
  final double? height;

  const _ArtPlaceholderCanvas({
    required this.artwork,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            artwork.primaryColor.withValues(alpha: 0.85),
            artwork.secondaryColor.withValues(alpha: 0.85),
            AppTheme.surface,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Padrão de textura artística procedural em fundo
          Positioned.fill(
            child: CustomPaint(
              painter: _ArtPatternPainter(
                color1: artwork.primaryColor,
                color2: artwork.secondaryColor,
              ),
            ),
          ),
          // Conteúdo central informativo do placeholder
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.35),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                        width: 1.5,
                      ),
                    ),
                    child: const Icon(
                      Icons.palette_outlined,
                      size: 36,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    artwork.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      artwork.category,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    artwork.imagePath,
                    style: const TextStyle(
                      color: Colors.white38,
                      fontSize: 11,
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ArtPatternPainter extends CustomPainter {
  final Color color1;
  final Color color2;

  _ArtPatternPainter({required this.color1, required this.color2});

  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final paint2 = Paint()
      ..color = Colors.black.withValues(alpha: 0.12)
      ..style = PaintingStyle.fill;

    // Círculos abstratos artísticos
    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.2),
      size.width * 0.35,
      paint1,
    );

    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.8),
      size.width * 0.25,
      paint2,
    );

    // Linha curva artística
    final path = Path();
    path.moveTo(0, size.height * 0.6);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.3,
      size.width,
      size.height * 0.7,
    );
    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
