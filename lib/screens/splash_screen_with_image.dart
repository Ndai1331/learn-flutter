import 'package:flutter/material.dart';
import 'welcome_screen.dart';

/// Splash Screen với ảnh thật (nếu bạn có file ảnh logo)
/// Cách sử dụng:
/// 1. Thêm ảnh vào thư mục: assets/images/logo.png
/// 2. Thêm vào pubspec.yaml:
///    flutter:
///      assets:
///        - assets/images/
/// 3. Sử dụng widget này thay vì SplashScreen
class SplashScreenWithImage extends StatefulWidget {
  const SplashScreenWithImage({super.key});

  @override
  State<SplashScreenWithImage> createState() => _SplashScreenWithImageState();
}

class _SplashScreenWithImageState extends State<SplashScreenWithImage> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Cách 1: Sử dụng ảnh từ assets (nếu đã thêm vào pubspec.yaml)
            // Image.asset(
            //   'assets/images/logo.png',
            //   width: 200,
            //   height: 200,
            // ),

            // Cách 2: Sử dụng ảnh từ URL (internet)
            // Image.network(
            //   'https://example.com/logo.png',
            //   width: 200,
            //   height: 200,
            //   loadingBuilder: (context, child, loadingProgress) {
            //     if (loadingProgress == null) return child;
            //     return const CircularProgressIndicator();
            //   },
            // ),

            // Cách 3: Sử dụng Icon (như hiện tại)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const Icon(
                Icons.medical_services,
                size: 120,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),

            const Text(
              'Booking App',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),

            const Text(
              'Đặt lịch hẹn khám sức khỏe',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 50),

            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
