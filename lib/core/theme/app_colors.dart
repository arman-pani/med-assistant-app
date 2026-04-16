import 'package:flutter/material.dart';

sealed class AppColors {
  const AppColors._();

  static const Color backgroundDark = Color(0xFF121212);
  static const Color backgroundCard = Color(0xFF1E1E1E);
  static const Color backgroundElevated = Color(0xFF252525);
  static const Color backgroundInput = Color(0xFF2A2A2A);
  
  static const Color primaryYellow = Color(0xFFFFD600);
  static const Color primaryYellowLight = Color(0xFFFFE566);
  static const Color primaryYellowDark = Color(0xFFC7A800);
  
  static const Color textPrimary = Color(0xFFF5F5F5);
  static const Color textSecondary = Color(0xFFA0A0A0);
  static const Color textOnYellow = Color(0xFF121212);
  
  static const Color divider = Color(0xFF2E2E2E);
  static const Color error = Color(0xFFCF6679);
  static const Color success = Color(0xFF66BB6A);
  
  static const Color userBubble = Color(0xFF2C2A1A);
  static const Color aiBubble = Color(0xFF1E1E1E);
}
