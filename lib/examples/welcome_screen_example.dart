import 'package:flutter/material.dart';

/// Example 1: Welcome Screen
/// This is a simple StatelessWidget example
/// Compare with: A simple page component in .NET (no state)
class WelcomeScreenExample extends StatelessWidget {
  const WelcomeScreenExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chào Mừng bạn đến với booking app'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            const Icon(
              Icons.medical_services,
              size: 100,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            
            // Title
            const Text(
              'Chào Mừng Đến Với',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            
            const Text(
              'Booking App',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 40),
            
            // Button
            ElevatedButton(
              onPressed: () {
                // Navigate to next screen (we'll learn this later)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Bắt đầu đặt lịch!'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Bắt Đầu',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

