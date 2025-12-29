# 📱 Hướng Dẫn Chạy App Flutter Trên macOS với Xcode

## ✅ Kiểm Tra Setup

### 1. Kiểm tra Flutter đã cài đặt
```bash
flutter doctor
```

### 2. Cài đặt CocoaPods (Cần thiết cho iOS)
CocoaPods là package manager cho iOS, cần thiết để Flutter plugins hoạt động trên iOS.

```bash
sudo gem install cocoapods
```

**Lưu ý:** Nếu gặp lỗi permission, thử:
```bash
sudo gem install -n /usr/local/bin cocoapods
```

Sau khi cài xong, kiểm tra:
```bash
pod --version
```

### 3. Cài đặt dependencies cho iOS
```bash
cd ios
pod install
cd ..
```

---

## 🚀 CÁCH CHẠY APP TRÊN iOS SIMULATOR

### Cách 1: Chạy từ Terminal (Khuyên dùng)

#### Bước 1: Mở iOS Simulator
```bash
# Mở Simulator
open -a Simulator
```

Hoặc liệt kê các simulator có sẵn:
```bash
flutter emulators
```

#### Bước 2: Chọn Simulator (nếu có nhiều)
```bash
# Xem danh sách devices
flutter devices

# Chọn iOS Simulator cụ thể (ví dụ: iPhone 15)
flutter emulators --launch apple_ios_simulator
```

#### Bước 3: Chạy app
```bash
# Từ thư mục dự án
cd /Users/admin/Documents/Projects/booking_app
flutter run
```

**Lưu ý:** Lần đầu chạy có thể mất vài phút để build.

---

### Cách 2: Chạy từ Xcode

#### Bước 1: Mở Xcode
```bash
open ios/Runner.xcworkspace
```

**QUAN TRỌNG:** Phải mở file `.xcworkspace`, KHÔNG phải `.xcodeproj`

#### Bước 2: Chọn Simulator
- Ở thanh toolbar trên cùng, click vào dropdown bên cạnh nút Play
- Chọn một iOS Simulator (ví dụ: iPhone 15 Pro)

#### Bước 3: Chạy app
- Nhấn nút **Play** (▶️) hoặc nhấn `Cmd + R`

---

### Cách 3: Chạy từ VS Code / Cursor

1. Mở project trong VS Code/Cursor
2. Nhấn `F5` hoặc click vào nút "Run" ở góc trên bên phải
3. Chọn "Dart & Flutter" khi được hỏi
4. Chọn iOS Simulator từ danh sách devices

---

## 🎯 CÁC LỆNH HỮU ÍCH

### Xem danh sách devices
```bash
flutter devices
```

### Xem danh sách emulators
```bash
flutter emulators
```

### Chạy trên device cụ thể
```bash
flutter run -d "iPhone 15 Pro"
```

### Hot Reload (Khi app đang chạy)
- Nhấn `r` trong terminal để reload
- Nhấn `R` để hot restart (restart toàn bộ app)
- Nhấn `q` để quit

### Clean build (Khi gặp lỗi)
```bash
flutter clean
flutter pub get
flutter run
```

---

## 🔧 XỬ LÝ LỖI THƯỜNG GẶP

### Lỗi 1: "CocoaPods not installed"
**Giải pháp:**
```bash
sudo gem install cocoapods
cd ios
pod install
cd ..
```

### Lỗi 2: "No devices found"
**Giải pháp:**
```bash
# Mở Simulator
open -a Simulator

# Hoặc
flutter emulators --launch apple_ios_simulator
```

### Lỗi 3: "Unable to get list of installed Simulator runtimes"
**Giải pháp:**
1. Mở Xcode
2. Vào **Xcode > Settings > Platforms**
3. Tải iOS Simulator runtime nếu chưa có

Hoặc:
```bash
xcode-select --install
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
```

### Lỗi 4: Build failed
**Giải pháp:**
```bash
# Clean và rebuild
flutter clean
cd ios
rm -rf Pods Podfile.lock
pod install
cd ..
flutter pub get
flutter run
```

---

## 📱 CHỌN SIMULATOR PHÙ HỢP

### Các Simulator phổ biến:
- **iPhone 15 Pro** - Mới nhất, khuyên dùng
- **iPhone 14** - Phổ biến
- **iPhone SE** - Màn hình nhỏ
- **iPad Pro** - Tablet

### Chạy trên Simulator cụ thể:
```bash
# Xem danh sách
xcrun simctl list devices available

# Chạy trên iPhone 15 Pro
flutter run -d "iPhone 15 Pro"
```

---

## 🎨 TIPS & TRICKS

### 1. Hot Reload
- Sửa code → Lưu file → App tự động reload (giữ nguyên state)
- Rất nhanh, không cần rebuild

### 2. Hot Restart
- Nhấn `R` trong terminal
- Restart toàn bộ app (mất state)

### 3. Debug Mode
- App chạy chậm hơn nhưng có thể debug
- Có thể đặt breakpoint trong VS Code/Cursor

### 4. Release Mode (Build để test)
```bash
flutter run --release
```
- App chạy nhanh hơn, giống như app thật
- Không thể debug

---

## 🚀 QUY TRÌNH CHẠY APP HÀNG NGÀY

1. **Mở Terminal**
2. **Di chuyển đến thư mục project:**
   ```bash
   cd /Users/admin/Documents/Projects/booking_app
   ```
3. **Mở Simulator (nếu chưa mở):**
   ```bash
   open -a Simulator
   ```
4. **Chạy app:**
   ```bash
   flutter run
   ```
5. **Sửa code và nhấn `r` để hot reload**

---

## 📚 TÀI LIỆU THAM KHẢO

- [Flutter iOS Setup](https://docs.flutter.dev/get-started/install/macos)
- [Running Flutter Apps](https://docs.flutter.dev/get-started/test-drive)
- [CocoaPods Guide](https://guides.cocoapods.org/)

---

## ✅ CHECKLIST TRƯỚC KHI CHẠY

- [ ] Flutter đã cài đặt (`flutter doctor`)
- [ ] Xcode đã cài đặt và mở ít nhất 1 lần
- [ ] CocoaPods đã cài đặt (`pod --version`)
- [ ] Đã chạy `pod install` trong thư mục `ios/`
- [ ] iOS Simulator đã mở
- [ ] Đã chạy `flutter pub get`

**Chúc bạn code vui vẻ! 🎉**

