/// Based on https://stackoverflow.com/a/63417082/8174191

import 'dart:io';

void main() async {
  final result = await Process.run('flutter', ['--version']);
  final declarations = constantDeclarationsFromMap({
    'flutterInfo': result.stdout.replaceAll('\n', '\\n'),
    'buildDate': DateTime.now().millisecondsSinceEpoch,
  }).join('\n');
  File('lib/constants.dart').writeAsStringSync(declarations);
}

Iterable<String> constantDeclarationsFromMap(
  Map<String, dynamic> map, [
  String prefix = 'k',
]) {
  String capitalize(String text) =>
      text.isEmpty ? text : '${text[0].toUpperCase()}${text.substring(1)}';

  String constantName(String name, String prefix) =>
      prefix.isEmpty ? name : prefix + capitalize(name);

  dynamic formatValue(dynamic value) {
    if (value is String) {
      return "'$value'";
    } else if (value is num) {
      return value;
    } else {
      throw ArgumentError('Unsupported value type: ${value.runtimeType}');
    }
  }

  return map.entries.map(
    (e) => 'const ${constantName(e.key, prefix)} = ${formatValue(e.value)};',
  );
}
