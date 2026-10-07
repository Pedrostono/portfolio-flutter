import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/about_section.dart';
import '../widgets/challenge_solution_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/features_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/gallery_section.dart';
import '../widgets/header_nav.dart';
import '../widgets/hero_artwork_card.dart';
import '../widgets/results_section.dart';
import '../widgets/tech_section.dart';
import '../widgets/visual_showcase.dart';

/// Tela principal do portfólio (Single Page com navegação por rolagem suave).
class PortfolioHomeScreen extends StatefulWidget {
  const PortfolioHomeScreen({super.key});

  @override
  State<PortfolioHomeScreen> createState() => _PortfolioHomeScreenState();
}

class _PortfolioHomeScreenState extends State<PortfolioHomeScreen> {
  final ScrollController _scrollController = ScrollController();

  // Keys para cada seção para permitir rolagem suave (Anchor navigation)
  final GlobalKey _visualKey = GlobalKey();
  final GlobalKey _galleryKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width < 600
        ? 16.0
        : (width < 1024 ? 32.0 : (width - 1100) / 2).clamp(32.0, 150.0);

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Column(
          children: [
            // 1. HEADER / NAVEGAÇÃO FIXO NO TOPO
            HeaderNav(
              onNavigateToProjects: () => _scrollToSection(_galleryKey),
              onNavigateToAbout: () => _scrollToSection(_aboutKey),
              onNavigateToContact: () => _scrollToSection(_contactKey),
            ),

            // CONTEÚDO ROLÁVEL COM AS 10 SEÇÕES
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                    children: [
                      const SizedBox(height: 32),

                      // 2. OBRA EM DESTAQUE (HERO CARD)
                      HeroArtworkCard(
                        onViewGallery: () => _scrollToSection(_galleryKey),
                        onViewProject: () => _scrollToSection(_visualKey),
                      ),
                      const SizedBox(height: 48),

                      // 3. ÁREA VISUAL PRINCIPAL
                      Container(
                        key: _visualKey,
                        child: const VisualShowcase(),
                      ),
                      const SizedBox(height: 56),

                      // 4. O DESAFIO E A SOLUÇÃO
                      const ChallengeSolutionSection(),
                      const SizedBox(height: 56),

                      // 5. TECNOLOGIAS UTILIZADAS
                      const TechSection(),
                      const SizedBox(height: 56),

                      // 6. CARACTERÍSTICAS PRINCIPAIS
                      const FeaturesSection(),
                      const SizedBox(height: 56),

                      // 7. GALERIA
                      Container(
                        key: _galleryKey,
                        child: const GallerySection(),
                      ),
                      const SizedBox(height: 56),

                      // 8. RESULTADOS E LIÇÕES APRENDIDAS
                      const ResultsSection(),
                      const SizedBox(height: 56),

                      // 9. SOBRE
                      Container(
                        key: _aboutKey,
                        child: const AboutSection(),
                      ),
                      const SizedBox(height: 56),

                      // 10. CALL TO ACTION / CONTATO
                      Container(
                        key: _contactKey,
                        child: const ContactSection(),
                      ),
                      const SizedBox(height: 64),

                      // RODAPÉ
                      const FooterSection(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
