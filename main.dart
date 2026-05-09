import 'dart:ui';
import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(debugShowCheckedModeBanner: false, home: WorkshopScreen()),
);

class WorkshopScreen extends StatelessWidget {
  const WorkshopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Menggunakan Theme lokal agar kodingan terlihat lebih niat
    return Theme(
      data: ThemeData(fontFamily: 'sans-serif'),
      child: Scaffold(
        body: Stack(
          children: [
            // 1. Background Layer: Deep Crimson Gradient
            Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(-0.5, -0.6),
                  radius: 1.5,
                  colors: [Color(0xFFD32F2F), Color(0xFF1A0000)],
                ),
              ),
            ),

            // 2. Content Layer
            SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _buildHeaderSection(),
                  const SizedBox(height: 30),
                  _buildMainContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGET HELPER: HEADER SECTION ---
  Widget _buildHeaderSection() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white24, width: 2),
          ),
          child: const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white10,
            child: Icon(Icons.person_outline, color: Colors.white, size: 50),
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          "Muhamad Khoerul Ramadan",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            "Software Engineering Student",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  // --- WIDGET HELPER: MAIN CARD (GLASSMORPHISM) ---
  Widget _buildMainContent() {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9), // Sedikit transparan
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBadgeRow(),
                const SizedBox(height: 20),
                const Text(
                  "Workshop Flutter & AI Implementation",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF2D3436),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 30),
                _buildInfoTile(
                  Icons.calendar_today_rounded,
                  "Waktu Pelaksanaan",
                  "Senin, 20 Mei 2026",
                ),
                _buildInfoTile(
                  Icons.location_on_rounded,
                  "Lokasi Workshop",
                  "Aula Utama Gedung A",
                ),
                _buildInfoTile(
                  Icons.confirmation_num_rounded,
                  "Status Tiket",
                  "Tersedia 20 Slot",
                ),

                const Spacer(),

                // Button dengan Desain Premium
                Align(
                  alignment: Alignment.centerRight,
                  child: _buildRegisterButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBadgeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFFB71C1C),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            "UPCOMING",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Icon(Icons.bookmark_border, color: Colors.grey),
      ],
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: const Color(0xFFB71C1C).withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFFB71C1C), size: 22),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: Color(0xFF2D3436),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterButton() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB71C1C).withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFB71C1C),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          elevation: 0,
        ),
        child: const Text(
          "DAFTAR SEKARANG",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
    );
  }
}
