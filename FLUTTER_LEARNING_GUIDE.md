# 📚 Hướng Dẫn Học Flutter Cho Người Mới (Có Kinh Nghiệm Backend .NET)

## 🎯 Mục Tiêu Dự Án
Xây dựng **App Booking Lịch Hẹn Khám Sức Khỏe** với các tính năng:
- ✅ Đặt lịch hẹn
- ✅ Trả kết quả file PDF (có thể là URL file)
- ✅ Xem kết quả file
- ✅ Quản lý văn bản
- ✅ Chọn văn bản ký số file PDF (tích hợp AI để tóm tắt nội dung file)

---

## 📖 PHẦN 1: KIẾN THỨC CƠ BẢN FLUTTER

### 1.1. Flutter là gì?
- **Flutter** là framework của Google để xây dựng ứng dụng đa nền tảng (iOS, Android, Web, Desktop)
- Sử dụng ngôn ngữ **Dart** (tương tự C# về cú pháp)
- **Hot Reload**: Thay đổi code và thấy kết quả ngay lập tức (giống như bạn đã quen với .NET)

### 1.2. So Sánh với .NET (Để Bạn Dễ Hiểu)

| .NET Concept | Flutter/Dart Equivalent |
|--------------|-------------------------|
| `class` | `class` (giống nhau) |
| `async/await` | `async/await` (giống nhau) |
| `List<T>` | `List<T>` (giống nhau) |
| `Dictionary<TKey, TValue>` | `Map<K, V>` |
| `using` | `import` |
| `namespace` | `package` |
| `var` | `var` hoặc `final` hoặc `const` |
| `null` | `null` (nhưng Dart có null safety) |
| `string` | `String` |
| `int`, `double`, `bool` | `int`, `double`, `bool` |

### 1.3. Cấu Trúc Dự Án Flutter

```
booking_app/
├── lib/                    # Thư mục chứa code chính (giống như src/ trong .NET)
│   └── main.dart          # File entry point (giống Program.cs)
├── pubspec.yaml           # File quản lý dependencies (giống .csproj hoặc packages.config)
├── android/               # Code Android native
├── ios/                   # Code iOS native
└── test/                  # Unit tests
```

---

## 📖 PHẦN 2: DART LANGUAGE CƠ BẢN

### 2.1. Biến và Kiểu Dữ Liệu

```dart
// Khai báo biến
String name = "Nguyễn Văn A";
int age = 25;
double height = 1.75;
bool isActive = true;

// var - tự động suy luận kiểu (giống var trong C#)
var email = "test@example.com";  // Dart tự biết là String

// final - giá trị không thể thay đổi sau khi gán (giống readonly trong C#)
final String userId = "12345";

// const - hằng số compile-time (giống const trong C#)
const double pi = 3.14159;
```

### 2.2. Null Safety (Quan Trọng!)

Dart có null safety mạnh mẽ:

```dart
// Non-nullable (mặc định)
String name = "John";  // Không thể null
// name = null;  // ❌ Lỗi!

// Nullable (thêm ?)
String? email = null;  // Có thể null
email = "test@example.com";

// Null-aware operators
String? result = email?.toUpperCase();  // Nếu email null thì result = null
String safeResult = email ?? "default";  // Nếu email null thì dùng "default"
```

### 2.3. Functions

```dart
// Function cơ bản
void printMessage(String message) {
  print(message);
}

// Function trả về giá trị
int add(int a, int b) {
  return a + b;
}

// Arrow function (short syntax)
int multiply(int a, int b) => a * b;

// Named parameters (rất hay dùng trong Flutter)
void createUser({required String name, int? age}) {
  print("Name: $name, Age: ${age ?? 0}");
}

// Gọi function với named parameters
createUser(name: "John", age: 25);
createUser(name: "Jane");  // age sẽ là null
```

### 2.4. Classes và Objects

```dart
// Class cơ bản
class User {
  String name;
  int age;
  
  // Constructor
  User(this.name, this.age);
  
  // Named constructor
  User.anonymous() : name = "Anonymous", age = 0;
  
  // Method
  void introduce() {
    print("Tôi là $name, $age tuổi");
  }
}

// Sử dụng
var user = User("Nguyễn Văn A", 25);
user.introduce();
```

### 2.5. Async/Await (Giống .NET)

```dart
// Async function
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return "Data loaded";
}

// Sử dụng
void loadData() async {
  String data = await fetchData();
  print(data);
}
```

---

## 📖 PHẦN 3: FLUTTER WIDGETS CƠ BẢN

### 3.1. Widget là gì?
- **Widget** = Component trong Flutter
- Mọi thứ trong Flutter đều là Widget (giống như Component trong React)
- Có 2 loại Widget:
  - **StatelessWidget**: Không có state (giống như component không có state)
  - **StatefulWidget**: Có state (giống như component có state)

### 3.2. Widget Tree (Cây Widget)

```dart
MaterialApp          // Root widget
  └── Scaffold       // Layout chính
      ├── AppBar     // Thanh trên cùng
      ├── Body       // Nội dung chính
      └── FloatingActionButton  // Nút nổi
```

### 3.3. Các Widget Cơ Bản

#### Text Widget
```dart
Text('Hello Flutter')
Text(
  'Hello Flutter',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  ),
)
```

#### Container Widget (Giống div trong HTML)
```dart
Container(
  width: 200,
  height: 100,
  color: Colors.blue,
  padding: EdgeInsets.all(16),
  margin: EdgeInsets.all(8),
  child: Text('Hello'),
)
```

#### Column Widget (Sắp xếp theo chiều dọc)
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ],
)
```

#### Row Widget (Sắp xếp theo chiều ngang)
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text('Left'),
    Text('Center'),
    Text('Right'),
  ],
)
```

#### Button Widgets
```dart
// ElevatedButton (nút nổi)
ElevatedButton(
  onPressed: () {
    print('Button clicked');
  },
  child: Text('Click me'),
)

// TextButton (nút text)
TextButton(
  onPressed: () {},
  child: Text('Text Button'),
)

// IconButton
IconButton(
  onPressed: () {},
  icon: Icon(Icons.favorite),
)
```

### 3.4. Scaffold Widget (Layout Chính)

```dart
Scaffold(
  appBar: AppBar(
    title: Text('My App'),
  ),
  body: Center(
    child: Text('Hello World'),
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
)
```

---

## 📖 PHẦN 4: STATE MANAGEMENT (Quản Lý State)

### 4.1. StatelessWidget vs StatefulWidget

#### StatelessWidget (Không có state)
```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Static content');
  }
}
```

#### StatefulWidget (Có state)
```dart
class CounterWidget extends StatefulWidget {
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;
  
  void _increment() {
    setState(() {  // Quan trọng! Phải gọi setState để rebuild UI
      _counter++;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Counter: $_counter'),
        ElevatedButton(
          onPressed: _increment,
          child: Text('Increment'),
        ),
      ],
    );
  }
}
```

**Lưu ý quan trọng:**
- Muốn thay đổi UI → Phải gọi `setState()`
- `setState()` sẽ rebuild widget tree
- Giống như `useState` trong React hoặc `StateHasChanged()` trong Blazor

---

## 📖 PHẦN 5: NAVIGATION (Điều Hướng)

### 5.1. Điều Hướng Cơ Bản

```dart
// Điều hướng đến màn hình mới
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => SecondScreen(),
  ),
);

// Quay lại màn hình trước
Navigator.pop(context);

// Điều hướng và truyền dữ liệu
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailScreen(data: "Hello"),
  ),
);
```

### 5.2. Named Routes (Định Tuyến Có Tên)

```dart
// Trong MaterialApp
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => HomeScreen(),
    '/detail': (context) => DetailScreen(),
  },
)

// Sử dụng
Navigator.pushNamed(context, '/detail');
```

---

## 📖 PHẦN 6: LÀM VIỆC VỚI API (HTTP Requests)

### 6.1. Thêm Dependencies

Thêm vào `pubspec.yaml`:
```yaml
dependencies:
  http: ^1.1.0
```

Sau đó chạy: `flutter pub get`

### 6.2. Gọi API

```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

// GET request
Future<Map<String, dynamic>> fetchData() async {
  final response = await http.get(
    Uri.parse('https://api.example.com/data'),
  );
  
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

// POST request
Future<void> createBooking(Map<String, dynamic> data) async {
  final response = await http.post(
    Uri.parse('https://api.example.com/bookings'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode(data),
  );
  
  if (response.statusCode == 201) {
    print('Booking created successfully');
  }
}
```

---

## 📖 PHẦN 7: LÀM VIỆC VỚI FILE PDF

### 7.1. Thêm Dependencies

```yaml
dependencies:
  pdf: ^3.10.0
  printing: ^5.12.0
  http: ^1.1.0
  path_provider: ^2.1.0
```

### 7.2. Tải và Hiển Thị PDF từ URL

```dart
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<File> downloadPDF(String url) async {
  final response = await http.get(Uri.parse(url));
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/result.pdf');
  await file.writeAsBytes(response.bodyBytes);
  return file;
}
```

---

## 📖 PHẦN 8: LƯU TRỮ DỮ LIỆU (Local Storage)

### 8.1. SharedPreferences (Lưu dữ liệu đơn giản)

```yaml
dependencies:
  shared_preferences: ^2.2.0
```

```dart
import 'package:shared_preferences/shared_preferences.dart';

// Lưu dữ liệu
Future<void> saveData(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

// Đọc dữ liệu
Future<String?> getData(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}
```

### 8.2. SQLite (Database Local)

```yaml
dependencies:
  sqflite: ^2.3.0
  path: ^1.8.0
```

---

## 📖 PHẦN 9: ROADMAP HỌC TẬP CHO DỰ ÁN CỦA BẠN

### Tuần 1: Học Cơ Bản
- [ ] Hiểu về Widget và Widget Tree
- [ ] Làm quen với StatelessWidget và StatefulWidget
- [ ] Học các Widget cơ bản: Text, Container, Column, Row, Button
- [ ] Thực hành: Tạo màn hình đơn giản

### Tuần 2: Navigation và Form
- [ ] Học Navigation giữa các màn hình
- [ ] Học Form và TextField
- [ ] Validation form
- [ ] Thực hành: Tạo màn hình đặt lịch hẹn (form)

### Tuần 3: API và State Management
- [ ] Học gọi API với http package
- [ ] Học cách xử lý async/await
- [ ] Học State Management cơ bản (setState)
- [ ] Thực hành: Kết nối với backend API

### Tuần 4: PDF và File Handling
- [ ] Học cách tải PDF từ URL
- [ ] Học cách hiển thị PDF trong app
- [ ] Học cách lưu file PDF local
- [ ] Thực hành: Tạo màn hình xem kết quả PDF

### Tuần 5: Advanced Features
- [ ] Học cách tích hợp AI (API calls)
- [ ] Học cách ký số file PDF
- [ ] Học cách quản lý danh sách văn bản
- [ ] Thực hành: Hoàn thiện các tính năng còn lại

---

## 📖 PHẦN 10: BEST PRACTICES

### 10.1. Tổ Chức Code

```
lib/
├── main.dart
├── models/           # Data models (giống như DTO trong .NET)
│   └── booking.dart
├── screens/          # Các màn hình
│   ├── home_screen.dart
│   ├── booking_screen.dart
│   └── result_screen.dart
├── services/         # Business logic (giống như Service layer trong .NET)
│   ├── api_service.dart
│   └── pdf_service.dart
├── widgets/          # Reusable widgets
│   └── custom_button.dart
└── utils/            # Utilities
    └── constants.dart
```

### 10.2. Naming Conventions

- **Files**: `snake_case.dart` (ví dụ: `booking_screen.dart`)
- **Classes**: `PascalCase` (ví dụ: `BookingScreen`)
- **Variables/Functions**: `camelCase` (ví dụ: `createBooking`)
- **Private members**: Bắt đầu với `_` (ví dụ: `_counter`, `_loadData`)

### 10.3. Comments

```dart
// Single line comment

/// Documentation comment (giống XML comments trong C#)
/// This function creates a new booking
Future<void> createBooking() async {
  // Implementation
}
```

---

## 🎯 BÀI TẬP THỰC HÀNH NGAY HÔM NAY

### Bài 1: Tạo Màn Hình Chào Mừng
Tạo một màn hình đơn giản với:
- Text "Chào mừng đến với Booking App"
- Một nút "Bắt đầu"

### Bài 2: Tạo Màn Hình Đặt Lịch (Form)
Tạo form với các trường:
- Tên bệnh nhân (TextField)
- Số điện thoại (TextField)
- Ngày hẹn (DatePicker)
- Nút "Đặt lịch"

### Bài 3: Hiển Thị Danh Sách
Tạo màn hình hiển thị danh sách lịch hẹn (dùng ListView)

---

## 📚 TÀI LIỆU THAM KHẢO

- [Flutter Official Docs](https://docs.flutter.dev/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Flutter Cookbook](https://docs.flutter.dev/cookbook)
- [pub.dev](https://pub.dev/) - Package repository (giống NuGet)

---

## 💡 MẸO HỌC TẬP

1. **Sử dụng Hot Reload**: Thay đổi code và nhấn `r` trong terminal để reload ngay
2. **Đọc Error Messages**: Flutter có error messages rất rõ ràng
3. **Sử dụng Flutter Inspector**: Debug UI trong DevTools
4. **Thực hành nhiều**: Code nhiều sẽ quen tay
5. **So sánh với .NET**: Khi gặp khái niệm mới, thử so sánh với .NET để dễ hiểu

---

## 🚀 BƯỚC TIẾP THEO

1. Đọc và hiểu code trong `main.dart`
2. Thử sửa đổi code để làm quen
3. Tạo màn hình đầu tiên cho app booking
4. Kết nối với backend API của bạn (nếu đã có)

**Chúc bạn học tập vui vẻ! 🎉**

