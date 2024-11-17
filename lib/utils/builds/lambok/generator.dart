// lib/utils/builds/lambok/generator.dart
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../annotations.dart';

class LambokGenerator extends GeneratorForAnnotation<Sterilized> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is ClassElement) {
      final className = element.name;

      // Extract non-static fields
      final fields = element.fields.where((f) => !f.isStatic);

      // Generate `toMap`
      final toMapFields = fields.map((f) => "'${f.name}': ${f.name}").join(',');

      // Generate `fromMap` logic
      final fromMapFields = fields.map((f) {
        return '${f.name}: map[\'${f.name}\'] as ${f.type}';
      }).join(',');

      // Generate `copyWith` logic
      final copyWithParams =
          fields.map((f) => '${f.type}? ${f.name}').join(',');
      final copyWithFields = fields.map((f) {
        return '${f.name}: ${f.name} ?? this.${f.name}';
      }).join(',');

      // Generate setters and getters
      final setters = fields.map((f) {
        return '''
          set ${f.name}(${f.type} value) => ${f.name} = value;
        ''';
      }).join();

      final getters = fields.map((f) {
        return '''
          ${f.type} get ${f.name} => ${f.name};
        ''';
      }).join();

      return '''
        // GENERATED CODE - DO NOT MODIFY BY HAND
        // Jesse Dan

        import '${className.toLowerCase()}.dart';

        extension ${className}Extensions on $className {
          Map<String, dynamic> toMap() {
            return {$toMapFields};
          }

          $className copyWith({$copyWithParams}) {
            return $className($copyWithFields);
          }
        }

        // Factory method added to the original class
        extension ${className}FromMap on $className {
          static $className fromMap(Map<String, dynamic> map) {
            return $className($fromMapFields);
          }
        }
      ''';
    }

    return '';
  }
}
