import 'package:flutter/material.dart';

/// Modelo de dados para representar cada ilustração/obra de arte no portfólio.
class Artwork {
  final String id;
  final String title;
  final String category;
  final String year;
  final String description;
  final String technique;
  final String imagePath;
  final Color primaryColor;
  final Color secondaryColor;

  const Artwork({
    required this.id,
    required this.title,
    required this.category,
    required this.year,
    required this.description,
    required this.technique,
    required this.imagePath,
    this.primaryColor = const Color(0xFF8B5CF6),
    this.secondaryColor = const Color(0xFFEC4899),
  });
}
