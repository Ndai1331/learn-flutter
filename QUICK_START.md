# 🚀 Hướng Dẫn Nhanh: Chạy App Trên iOS Simulator

## ⚡ CÁCH NHANH NHẤT (3 Bước)

### Bước 1: Cài CocoaPods (Chỉ cần làm 1 lần)
Mở Terminal và chạy:
```bash
sudo gem install cocoapods
```

Nếu gặp lỗi permission, thử:
```bash
sudo gem install -n /usr/local/bin cocoapods
```

### Bước 2: Setup iOS Dependencies (Chỉ cần làm 1 lần)
```bash
cd /Users/admin/Documents/Projects/booking_app
cd ios
pod install
cd ..
```

### Bước 3: Mở Simulator và Chạy App
```bash
# Mở Simulator
open -a Simulator

# Đợi Simulator mở (khoảng 10-20 giây)

# Chạy app
flutter run
```

---

## 📱 CÁCH CHI TIẾT

### 1. Mở iOS Simulator

**Cách 1: Từ Terminal**
```bash
open -a Simulator
```

**Cách 2: Từ Xcode**
1. Mở Xcode
2. Menu: **Xcode > Open Developer Tool > Simulator**

**Cách 3: Từ Spotlight**
- Nhấn `Cmd + Space`
- Gõ "Simulator"
- Enter

### 2. Chọn iPhone Model (Nếu cần)

Trong Simulator, menu: **File > Open Simulator > iOS [version] > iPhone [model]**

Ví dụ: iPhone 15 Pro, iPhone 14, iPhone SE

### 3. Chạy App

Mở Terminal và chạy:
```bash
cd /Users/admin/Documents/Projects/booking_app
flutter run
```

**Lần đầu chạy có thể mất 2-5 phút để build.**

---

## 🎯 SAU KHI APP ĐÃ CHẠY

### Hot Reload (Rất nhanh!)
- Sửa code trong editor
- Lưu file (Cmd + S)
- Nhấn `r` trong terminal → App tự động reload

### Hot Restart
- Nhấn `R` trong terminal → Restart toàn bộ app

### Dừng App
- Nhấn `q` trong terminal

---

## ❌ XỬ LÝ LỖI

### Lỗi: "CocoaPods not installed"
```bash
sudo gem install cocoapods
cd ios && pod install && cd ..
```

### Lỗi: "No devices found"
1. Đảm bảo Simulator đã mở
2. Chạy: `flutter devices` để kiểm tra
3. Nếu vẫn không thấy, thử restart Simulator

### Lỗi: "Unable to get list of installed Simulator runtimes"
1. Mở Xcode
2. Vào **Xcode > Settings > Platforms**
3. Tải iOS Simulator runtime

### Lỗi Build Failed
```bash
flutter clean
cd ios
rm -rf Pods Podfile.lock
pod install
cd ..
flutter pub get
flutter run
```

---

## 💡 TIPS

1. **Lần đầu chạy:** Có thể mất 2-5 phút để build
2. **Lần sau:** Chỉ mất 10-30 giây
3. **Hot Reload:** Rất nhanh, chỉ vài giây
4. **Giữ Terminal mở:** Để có thể hot reload

---

## 📋 CHECKLIST

- [ ] CocoaPods đã cài (`pod --version`)
- [ ] Đã chạy `pod install` trong thư mục `ios/`
- [ ] Simulator đã mở
- [ ] Đã chạy `flutter run`

**Chúc bạn thành công! 🎉**

