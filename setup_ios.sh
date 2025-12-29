#!/bin/bash

# Script để setup iOS development cho Flutter app
# Chạy: bash setup_ios.sh

echo "🚀 Bắt đầu setup iOS development..."

# 1. Kiểm tra CocoaPods
echo "📦 Kiểm tra CocoaPods..."
if ! command -v pod &> /dev/null; then
    echo "⚠️  CocoaPods chưa được cài đặt. Đang cài đặt..."
    sudo gem install cocoapods
    if [ $? -eq 0 ]; then
        echo "✅ CocoaPods đã được cài đặt thành công!"
    else
        echo "❌ Lỗi khi cài CocoaPods. Thử: sudo gem install -n /usr/local/bin cocoapods"
        exit 1
    fi
else
    echo "✅ CocoaPods đã được cài đặt: $(pod --version)"
fi

# 2. Cài đặt iOS dependencies
echo "📱 Cài đặt iOS dependencies..."
cd ios
pod install
cd ..

if [ $? -eq 0 ]; then
    echo "✅ iOS dependencies đã được cài đặt!"
else
    echo "⚠️  Có thể cần chạy lại: cd ios && pod install"
fi

# 3. Kiểm tra Flutter
echo "🔍 Kiểm tra Flutter setup..."
flutter doctor

echo ""
echo "✅ Setup hoàn tất!"
echo ""
echo "📱 Để chạy app:"
echo "   1. Mở Simulator: open -a Simulator"
echo "   2. Chạy app: flutter run"
echo ""

