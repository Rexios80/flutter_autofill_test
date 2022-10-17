/// https://stackoverflow.com/a/63417082/8174191

import 'dart:io' show File, Process, ProcessResult;
import 'dart:convert' show json;

void main() {
  Process.run('flutter', ['--version', '--machine']).then(
    (ProcessResult results) {
      final result = Map<String, Object>.from(
        json.decode(results.stdout.toString()) as Map,
      );
      final declarations = constantDeclarationsFromMap(result, 'kFlutter');
      final file = File('lib/constants.dart');
      file.writeAsStringSync(declarations);
    },
  );
}

String constantDeclarationsFromMap(Map<String, Object> map,
    [String prefix = 'k']) {
  String capitalize(String text) =>
      text.isEmpty ? text : "${text[0].toUpperCase()}${text.substring(1)}";

  String constantName(String name, String prefix) =>
      prefix.isEmpty ? name : prefix + capitalize(name);

  return map.entries
      .map((e) =>
          'const ${constantName(e.key, prefix)} = ${json.encode(e.value)};')
      .join('\n');
}
