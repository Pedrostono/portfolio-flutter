import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../theme/app_theme.dart';

/// Header de navegação responsivo para a aplicação Web/Mobile.
class HeaderNav extends StatelessWidget {
  final VoidCallback onNavigateToProjects;
  final VoidCallback onNavigateToAbout;
  final VoidCallback onNavigateToContact;

  const HeaderNav({
    super.key,
    required this.onNavigateToProjects,
    required this.onNavigateToAbout,
    required this.onNavigateToContact,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 850;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 32,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: AppTheme.background.withValues(alpha: 0.9),
        border: const Border(
          bottom: BorderSide(color: AppTheme.surfaceBorder, width: 1),
        ),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo / Nome do Artista à Esquerda
              Flexible(child: _ArtistBrandLogo()),

              // Navegação à Direita (Desktop vs Mobile)
              if (isMobile)
                IconButton(
                  icon: const Icon(Icons.menu_rounded, color: Colors.white),
                  onPressed: () => _showMobileMenu(context),
                )
              else
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _NavButton(
                      label: 'Projetos',
                      onPressed: onNavigateToProjects,
                    ),
                    const SizedBox(width: 4),
                    _NavButton(
                      label: 'Sobre',
                      onPressed: onNavigateToAbout,
                    ),
                    const SizedBox(width: 4),
                    _NavButton(
                      label: 'Contato',
                      onPressed: onNavigateToContact,
                      isHighlighted: true,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceBorder,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.grid_view_rounded,
                    color: AppTheme.primaryAccent),
                title: const Text('Projetos',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.pop(context);
                  onNavigateToProjects();
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_outline_rounded,
                    color: AppTheme.secondaryAccent),
                title: const Text('Sobre',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.pop(context);
                  onNavigateToAbout();
                },
              ),
              ListTile(
                leading: const Icon(Icons.mail_outline_rounded,
                    color: AppTheme.tertiaryAccent),
                title: const Text('Contato',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.pop(context);
                  onNavigateToContact();
                },
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }
}

class _ArtistBrandLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: AppTheme.primaryGradient,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.palette_rounded,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                AppConstants.shortName,
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Portfólio de Ilustrações',
                style: TextStyle(
                  color: AppTheme.textMuted,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _NavButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isHighlighted;

  const _NavButton({
    required this.label,
    required this.onPressed,
    this.isHighlighted = false,
  });

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    if (widget.isHighlighted) {
      return ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryAccent,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        ),
        child: Text(widget.label),
      );
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          foregroundColor:
              _isHovered ? AppTheme.primaryAccent : AppTheme.textPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            fontWeight: _isHovered ? FontWeight.bold : FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
