import 'package:flutter/material.dart';

/// Example 3: Booking List Screen
/// This demonstrates ListView and data display
/// Compare with: A list/grid view in .NET
class BookingListExample extends StatefulWidget {
  const BookingListExample({super.key});

  @override
  State<BookingListExample> createState() => _BookingListExampleState();
}

class _BookingListExampleState extends State<BookingListExample> {
  // Sample data (in real app, this would come from API)
  final List<Map<String, dynamic>> _bookings = [
    {
      'id': 1,
      'patientName': 'Nguyễn Văn A',
      'phone': '0901234567',
      'date': '2024-01-15',
      'status': 'Đã xác nhận',
    },
    {
      'id': 2,
      'patientName': 'Trần Thị B',
      'phone': '0907654321',
      'date': '2024-01-16',
      'status': 'Chờ xác nhận',
    },
    {
      'id': 3,
      'patientName': 'Lê Văn C',
      'phone': '0912345678',
      'date': '2024-01-17',
      'status': 'Đã xác nhận',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh Sách Lịch Hẹn'),
        backgroundColor: Colors.purple,
      ),
      body: _bookings.isEmpty
          ? const Center(
              child: Text(
                'Chưa có lịch hẹn nào',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: _bookings.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final booking = _bookings[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Text(
                        booking['patientName'][0],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      booking['patientName'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('SĐT: ${booking['phone']}'),
                        Text('Ngày: ${booking['date']}'),
                      ],
                    ),
                    trailing: Chip(
                      label: Text(
                        booking['status'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      backgroundColor: booking['status'] == 'Đã xác nhận'
                          ? Colors.green
                          : Colors.orange,
                    ),
                    onTap: () {
                      // Navigate to detail screen (we'll learn this later)
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Xem chi tiết: ${booking['patientName']}',
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to booking form
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Mở form đặt lịch'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

