fvm install $1 --skip-setup
fvm global $1
flutter pub get
dart run tool/generate_constants.dart
flutter build web --base-href /flutter_autofill_test/$1/
mkdir -p built/$1
cp -r build/web/* built/$1/