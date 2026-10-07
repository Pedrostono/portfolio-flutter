import 'package:flutter/material.dart';
import 'artwork_model.dart';

/// Repositório contendo a lista de obras de arte do portfólio.
/// Para alterar os desenhos, modifique esta lista ou substitua as imagens em [assets/images/].
class ArtworkRepository {
  static const Artwork featuredArtwork = Artwork(
    id: 'destaque_main',
    title: 'Galeria de Ilustrações',
    category: 'Arte Digital',
    year: '2026',
    description:
        'Uma seleção de desenhos e estudos que exploram personagens, formas, cores e diferentes estilos visuais.',
    technique: 'Pintura / Arte Digital',
    imagePath: 'assets/images/destaque.jpeg',
    primaryColor: Color(0xFF6366F1),
    secondaryColor: Color(0xFFA855F7),
  );

  static const List<Artwork> galleryArtworks = [
    Artwork(
      id: 'desenho_01',
      title: 'Desenho 01',
      category: 'Estudo de Personagem',
      year: '2026',
      description:
          'Exploração de silhueta, expressão facial e dinâmica de personagens em estilo ilustração conceitual.',
      technique: 'Pintura / Arte Digital',
      imagePath: 'assets/images/desenho1.jpeg',
      primaryColor: Color(0xFF8B5CF6),
      secondaryColor: Color(0xFFD946EF),
    ),
    Artwork(
      id: 'desenho_02',
      title: 'Desenho 02',
      category: 'Paisagem & Cenário',
      year: '2026',
      description:
          'Estudo de profundidade de campo, iluminação e atmosfera de ambiente fantástico.',
      technique: 'Pintura / Arte Digital',
      imagePath: 'assets/images/desenho2.jpeg',
      primaryColor: Color(0xFF0EA5E9),
      secondaryColor: Color(0xFF10B981),
    ),
    Artwork(
      id: 'desenho_03',
      title: 'Desenho 03',
      category: 'Retrato em Cores',
      year: '2026',
      description:
          'Estudo sobre paleta de cores vibrantes, sombras suaves e contraste em retratos contemporâneos.',
      technique: 'Pintura / Arte Digital',
      imagePath: 'assets/images/desenho3.jpeg',
      primaryColor: Color(0xFFF59E0B),
      secondaryColor: Color(0xFFEF4444),
    ),
    Artwork(
      id: 'desenho_04',
      title: 'Desenho 04',
      category: 'Composição Visual',
      year: '2026',
      description:
          'Trabalho focado em formas geométricas, linhas orgânicas e ritmo visual fluido.',
      technique: 'Pintura / Arte Digital',
      imagePath: 'assets/images/desenho4.jpeg',
      primaryColor: Color(0xFFEC4899),
      secondaryColor: Color(0xFF8B5CF6),
    ),
    Artwork(
      id: 'desenho_05',
      title: 'Desenho 05',
      category: 'Line Art & Sombras',
      year: '2026',
      description:
          'Estudo de traço limpo, hachuras e hachurado cruzado inspirado em ilustração de livros e quadrinhos.',
      technique: 'Pintura / Arte Digital',
      imagePath: 'assets/images/desenho5.jpeg',
      primaryColor: Color(0xFF64748B),
      secondaryColor: Color(0xFF3B82F6),
    ),
    Artwork(
      id: 'desenho_06',
      title: 'Desenho 06',
      category: 'Atmosfera e Luz',
      year: '2026',
      description:
          'Composição explorando focos de luz intensa e sombras dramáticas para criar tom misterioso.',
      technique: 'Pintura / Arte Digital',
      imagePath: 'assets/images/desenho6.jpeg',
      primaryColor: Color(0xFF14B8A6),
      secondaryColor: Color(0xFF6366F1),
    ),
  ];
}
