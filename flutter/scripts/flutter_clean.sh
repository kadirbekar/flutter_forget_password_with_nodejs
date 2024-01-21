flutter clean
rm -rf pubspec.lock
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub get
cd ios && rm -rf Podfile.lock && pod install && pod update && cd ..
