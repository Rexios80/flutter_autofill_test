fvm install $1 --skip-setup
fvm global $1
# Disable every platform except web to save setup time
flutter config --no-enable-linux-desktop --no-enable-macos-desktop --no-enable-windows-desktop --no-enable-android --no-enable-ios --no-enable-fuchsia
flutter pub get
dart run tool/generate_constants.dart
flutter build web --base-href /flutter_autofill_test/$1/
mkdir -p built/$1
cp -r build/web/* built/$1/