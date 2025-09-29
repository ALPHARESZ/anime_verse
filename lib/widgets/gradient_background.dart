import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  // untuk background
  const GradientBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // definisi gradient awal
        gradient: LinearGradient(
          colors: [
            Color(0xFF1D1D2E), // warna awal
            Color(0xFF25254D)  // warna akhir
          ],
          begin: Alignment.topLeft, // arah mulai gradien
          end: Alignment.bottomLeft, //arah akhir gradien
        )
      ),
      // Tampilkan widget child di atas Container yang sudah bergradient
      child: child,
    );
  }
}

